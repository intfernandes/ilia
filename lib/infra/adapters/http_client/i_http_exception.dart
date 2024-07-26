

import 'package:ilia/infra/adapters/http_client/i_http_message.dart';
import 'package:ilia/infra/adapters/http_client/i_http_response.dart';
import 'package:ilia/infra/exceptions/exceptions.dart';

class IHttpException extends ServerException
    implements IHttpMessage {
  final int? statusCode;
  final dynamic error;
  final IHttpResponse? response;
   NetErrorType errorType;

  IHttpException({
    required super.message,
    this.statusCode,
    required this.error,
     this.errorType = NetErrorType.none,
    this.response,
    super.stacktrace,
  }){
     exception(response) ;
  }

  exception(response) { 
    if (response == null) {
      errorType = NetErrorType.disconnected;
    } else if (response!.statusCode >= 200 && response!.statusCode <= 299) {
      errorType = NetErrorType.none;
    } else if (response!.statusCode >= 500 && response!.statusCode < 600) {
      errorType = NetErrorType.timedOut;
    } else if (response!.statusCode >= 400 && response!.statusCode < 500) {
      errorType = NetErrorType.denied;
    }
  }
}

enum NetErrorType {
  none,
  disconnected,
  timedOut,
  denied,
}
