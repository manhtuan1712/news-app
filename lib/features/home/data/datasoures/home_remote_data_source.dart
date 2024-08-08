import 'package:dio/dio.dart';
import 'package:news_app/core/api/service/base/base_rest_service.dart';
import 'package:news_app/features/home/data/models/request/request_top_headlines_model.dart';
import 'package:news_app/features/home/data/models/response/response_sources_model.dart';
import 'package:news_app/features/home/data/models/response/response_top_headlines_model.dart';

abstract class HomeRemoteDataSource {
  Future<ResponseTopHeadlinesModel> getTopHeadlines(
    RequestTopHeadlinesModel request,
  );

  Future<ResponseSourcesModel> getSources();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  BaseRestService baseRestService;

  HomeRemoteDataSourceImpl({
    required this.baseRestService,
  });

  @override
  Future<ResponseTopHeadlinesModel> getTopHeadlines(
    RequestTopHeadlinesModel request,
  ) async {
    try {
      final response = await baseRestService.getTopHeadlines(
        request,
      );
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }

  @override
  Future<ResponseSourcesModel> getSources() async {
    try {
      final response = await baseRestService.getSources();
      return response;
    } on DioExceptionType {
      throw DioExceptionType;
    }
  }
}
