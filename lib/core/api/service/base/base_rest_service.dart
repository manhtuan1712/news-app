import 'package:dio/dio.dart';
import 'package:news_app/core/api/dio_logging_interceptor.dart';
import 'package:news_app/core/api/service/base/base_rest_client.dart';
import 'package:news_app/core/helpers/global_configs.dart';

class BaseRestService {
  Dio? _dio;

  BaseRestClient? _baseRestClient;

  BaseRestService() {
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(
        milliseconds: GlobalConfig.receiveTimeout,
      ),
      connectTimeout: const Duration(
        milliseconds: GlobalConfig.connectTimeOut,
      ),
    );
    _dio = Dio(options);
    _dio!.interceptors.add(
      DioLoggingInterceptor(),
    );
    _baseRestClient = BaseRestClient(
      _dio!,
      baseUrl: GlobalConfig.newsBaseUrl,
    );
  }
}
