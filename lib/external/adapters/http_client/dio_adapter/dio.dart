part of '../../../adapters/adapters.dart';

class DioFactory {
  static Dio dio() {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: connectTimeout),
      receiveTimeout: const Duration(microseconds: receiveTimeout),
    );
    return Dio(baseOptions);
  }
}

class DioHttpClientImpl implements IHttpClient {
  final Dio _dio;

  final Map<IHttpInterceptor, Interceptor> _interceptors = {};

  DioHttpClientImpl({required Dio dio}) : _dio = dio;

  @override
  void addInterceptors(IHttpInterceptor interceptor) {
    _interceptors[interceptor] = DioInterceptorImpl(interceptor: interceptor);
    _dio.interceptors.add(_interceptors[interceptor]!);
  }

  @override
  void removeInterceptors(IHttpInterceptor interceptor) {
    _dio.interceptors.remove(_interceptors[interceptor]);
  }

  @override
  Future<IHttpResponse> upload(IHttpMultipartRequest multipart) async {
    final formData = FormData.fromMap({
      multipart.fileKey: MultipartFile.fromBytes(
        multipart.fileBytes ?? [],
        filename: multipart.fileName,
      ),
    });

    final response = await _dio.post(
      multipart.path,
      data: formData,
    );
    return DioAdapter.toClientResponse(response);
  }

  @override
  Future<IHttpResponse> delete(IHttpRequest request) async {
    try {
      final response = await _dio.delete(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<IHttpResponse> get(IHttpRequest request) async {
    try {
      final response = await _dio.get(
        request.path,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<IHttpResponse> patch(IHttpRequest request) async {
    try {
      final response = await _dio.patch(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<IHttpResponse> post(IHttpRequest request) async {
    try {
      final response = await _dio.post(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<IHttpResponse> put(IHttpRequest request) async {
    try {
      final response = await _dio.put(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }
}
