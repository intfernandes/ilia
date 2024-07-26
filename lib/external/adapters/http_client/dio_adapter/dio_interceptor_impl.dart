import 'package:dio/dio.dart';
import 'package:ilia/external/adapters/http_client/dio_adapter/dio_adapter.dart';
import 'package:ilia/infra/adapters/http_client/i_http_exception.dart';

import 'package:ilia/infra/adapters/http_client/i_http_interceptor.dart';
import 'package:ilia/infra/adapters/http_client/i_http_request.dart';
import 'package:ilia/infra/adapters/http_client/i_http_response.dart';

class DioInterceptorImpl implements Interceptor {
  final IHttpInterceptor interceptor;

  DioInterceptorImpl({required this.interceptor});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final restClientHttp = DioAdapter.toClientException(err);
    final message = await interceptor.onError(restClientHttp);

    if (message is IHttpException) {
      handler.next(DioAdapter.toDioException(message));
    } else if (message is IHttpResponse) {
      handler.resolve(DioAdapter.toResponse(message));
    }
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final restRequest = DioAdapter.toClientRequest(options);
    final message = await interceptor.onRequest(restRequest);

    if (message is IHttpException) {
      handler.reject(DioAdapter.toDioException(message));
    } else if (message is IHttpRequest) {
      handler.next(DioAdapter.toRequestOptions(message));
    } else if (message is IHttpResponse) {
      handler.resolve(DioAdapter.toResponse(message));
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final restResponse = DioAdapter.toClientResponse(response);
    final message = await interceptor.onResponse(restResponse);

    if (message is IHttpException) {
      handler.reject(DioAdapter.toDioException(message));
    } else if (message is IHttpResponse) {
      handler.next(DioAdapter.toResponse(message));
    }
  }
}
