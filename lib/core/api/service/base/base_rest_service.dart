import 'package:dio/dio.dart';
import 'package:news_app/core/api/dio_logging_interceptor.dart';
import 'package:news_app/core/api/service/base/base_rest_client.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/features/home/data/models/request/request_top_headlines_model.dart';
import 'package:news_app/features/home/data/models/response/response_sources_model.dart';
import 'package:news_app/features/home/data/models/response/response_top_headlines_model.dart';

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

  Future<ResponseTopHeadlinesModel> getTopHeadlines(
    RequestTopHeadlinesModel request,
  ) async {
    return _baseRestClient!.getTopHeadlines(
      request,
    );
  }

  Future<ResponseSourcesModel> getSources() async {
    return _baseRestClient!.getSources();
  }
}
