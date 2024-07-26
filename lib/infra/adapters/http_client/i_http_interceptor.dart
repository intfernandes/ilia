

import 'dart:async'; 

import 'package:ilia/infra/adapters/http_client/i_http_message.dart';
import 'package:ilia/infra/adapters/http_client/i_http_request.dart';
import 'package:ilia/infra/adapters/http_client/i_http_response.dart';
import 'package:ilia/infra/exceptions/exceptions.dart';

abstract interface class IHttpInterceptor  {
  FutureOr<IHttpMessage> onResponse(IHttpResponse response);
  FutureOr<IHttpMessage> onRequest(IHttpRequest request);
  FutureOr<IHttpMessage> onError(ServerException error);
}
