import 'dart:convert';

import 'package:ilia/infra/adapters/http_client/i_http_message.dart';

class IHttpRequest implements IHttpMessage {
  final HttpMethod method;
  final String path;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final Encoding? encoding;
  final dynamic data;

  IHttpRequest({
    required this.path,
    required this.method,
    this.data,
    this.queryParameters,
    this.headers,
    this.encoding,
  });

  static String encodeParams(Map<String, String> params) {
    var s = '';
    params.forEach((key, value) {
      if (value.isNotEmpty && value != 'null') {
        var urlEncode = Uri.encodeComponent(value);
        s += '${s == '' ? '?' : '&'}$key=$urlEncode';
      }
    });
    return s;
  }
}

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
  head;

  static HttpMethod ofType(method) {
    switch (method) {
      case 'get' || 'GET':
        return HttpMethod.get;
      case 'post' || 'POST':
        return HttpMethod.post;
      case 'put' || 'PUT':
        return HttpMethod.put;
      case 'patch' || 'PATCH':
        return HttpMethod.patch;
      case 'delete' || 'DELETE':
        return HttpMethod.delete;
      case 'head' || 'HEAD':
        return HttpMethod.head;
      default:
        return HttpMethod.get;
    }
  }
}
