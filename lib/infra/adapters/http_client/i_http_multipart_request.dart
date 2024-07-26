
import 'dart:convert';

import 'package:ilia/infra/adapters/http_client/i_http_request.dart';

class IHttpMultipartRequest {
  final String fileKey;
  final String fileName;
  final String path;
  final List<int>? fileBytes;
    final HttpMethod method;
  final Encoding? encoding;


  IHttpMultipartRequest({
    required this.fileKey,
    required this.fileName,
    required this.path,
    required this.fileBytes,
    required this.method,
     this.encoding,
  });
}
