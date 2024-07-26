library adapters;

/* _______________________ DEPENDENCY INJECTION _______________________ */
import 'package:ilia/infra/infra.dart';
import 'package:ilia/domain/repositories/i_tansactions_repository.dart';
import 'package:ilia/domain/usecases/create_transaction_uc.dart';
import 'package:ilia/external/datasources/datasources.dart';
import 'package:ilia/infra/datasources/i_transactions_datasource.dart';
import 'package:auto_injector/auto_injector.dart';
import 'package:get_it/get_it.dart';
/* ____________________________ CLIENT HTTP ____________________________ */
import 'package:dio/dio.dart';
import 'package:ilia/external/adapters/http_client/dio_adapter/dio_adapter.dart';
import 'package:ilia/external/adapters/http_client/dio_adapter/dio_interceptor_impl.dart';
import 'package:ilia/infra/adapters/http_client/i_http_client.dart';
import 'package:ilia/infra/adapters/http_client/i_http_interceptor.dart';
import 'package:ilia/infra/adapters/http_client/i_http_multipart_request.dart';
import 'package:ilia/infra/adapters/http_client/i_http_request.dart';
import 'package:ilia/infra/adapters/http_client/i_http_response.dart';
import 'package:ilia/infra/shared/platform_info/env.dart';

/* _______________________________________________________________________ */
part 'package:ilia/external/adapters/dependency_injection/getit_adapter.dart';
part 'package:ilia/external/adapters/dependency_injection/auto_injector_adapter.dart';
part 'package:ilia/external/adapters/http_client/dio_adapter/dio.dart';
