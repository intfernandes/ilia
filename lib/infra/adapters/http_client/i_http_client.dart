import 'package:ilia/infra/adapters/http_client/i_http_interceptor.dart';
import 'package:ilia/infra/adapters/http_client/i_http_multipart_request.dart';
import 'package:ilia/infra/adapters/http_client/i_http_request.dart';
import 'package:ilia/infra/adapters/http_client/i_http_response.dart';

abstract interface class IHttpClient {
  Future<IHttpResponse> post(IHttpRequest request);
  Future<IHttpResponse> get(IHttpRequest request);
  Future<IHttpResponse> put(IHttpRequest request);
  Future<IHttpResponse> delete(IHttpRequest request);
  Future<IHttpResponse> patch(IHttpRequest request);
  Future<IHttpResponse> upload(IHttpMultipartRequest multipart);
  void addInterceptors(IHttpInterceptor interceptor);
  void removeInterceptors(IHttpInterceptor interceptor);
}
