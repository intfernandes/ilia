
import 'package:dio/dio.dart';
import 'package:ilia/infra/adapters/http_client/i_http_exception.dart';
import 'package:ilia/infra/adapters/http_client/i_http_request.dart';
import 'package:ilia/infra/adapters/http_client/i_http_response.dart';

class DioAdapter {
  static IHttpException toClientException(DioException dioException) {
    return IHttpException(
      error: dioException.error,
      message: dioException.message ?? '',
      response: dioException.response == null
          ? null
          : toClientResponse(dioException.response!),
      statusCode: dioException.response?.statusCode,
    );
  }

  static DioException toDioException(IHttpException exception) {
    return DioException(
      requestOptions: RequestOptions(),
      error: exception.error,
      message: exception.message,
      response: exception.response == null
          ? null
          : toResponse(exception.response!),
    );
  }

  static IHttpRequest toClientRequest(RequestOptions request) {
 

    return IHttpRequest(
      method: HttpMethod.ofType(request.method) ,
      path: request.path,
      headers: request.headers,
      queryParameters: request.queryParameters,
      data: request.data,
    );
  }

  static RequestOptions toRequestOptions(IHttpRequest restClientRequest) {
    return RequestOptions(
      path: restClientRequest.path,
      data: restClientRequest.data,
      queryParameters: restClientRequest.queryParameters,
      headers: restClientRequest.headers,
    );
  }

  static IHttpResponse toClientResponse(Response response) {
    return IHttpResponse(
      request: toClientRequest(response.requestOptions),
      message: response.statusMessage,
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  static Response toResponse(IHttpResponse restClientResponse) {
    final headers = restClientResponse.request.headers ?? {};
    final dioHeaders = <String, List<String>>{};

    for (var key in headers.keys) {
      dioHeaders[key] = [headers[key]];
    }

    return Response(
      requestOptions: toRequestOptions(restClientResponse.request),
      data: restClientResponse.data,
      headers: Headers.fromMap(dioHeaders),
      statusCode: restClientResponse.statusCode,
      statusMessage: restClientResponse.message,
    );
  }
}
