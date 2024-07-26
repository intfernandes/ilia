

import 'package:ilia/infra/adapters/http_client/i_http_message.dart';
import 'package:ilia/infra/adapters/http_client/i_http_request.dart';

class IHttpResponse implements IHttpMessage {
  dynamic data;
  int? statusCode;
  String? message;
  IHttpRequest request;

  IHttpResponse({
    this.data,
    this.statusCode,
    this.message,
    required this.request,
  });
}
