import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/features/home/data/datasoures/home_local_data_source.dart';
import 'package:news_app/features/home/data/datasoures/home_remote_data_source.dart';
import 'package:news_app/features/home/data/models/request/request_top_headlines_model.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';
import 'package:news_app/features/home/data/models/response/response_sources_model.dart';
import 'package:news_app/features/home/data/models/response/response_top_headlines_model.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource homeLocalDataSource;

  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, ResponseTopHeadlinesModel>> getTopHeadlines(
    RequestTopHeadlinesModel request,
  ) async {
    try {
      var response = await homeRemoteDataSource.getTopHeadlines(
        request,
      );
      return Right(
        response,
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          mess: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, ResponseSourcesModel>> getSources() async {
    try {
      var response = await homeRemoteDataSource.getSources();
      return Right(
        response,
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          mess: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<HiveFailure, String>> saveTopHeadlinesLocal(
    List<ArticleModel> articles,
  ) async {
    try {
      var response = await homeLocalDataSource.saveTopHeadlinesLocal(
        articles,
      );
      return Right(
        response,
      );
    } on HiveError catch (error) {
      return Left(
        HiveFailure(
          mess: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<HiveFailure, List<ArticleModel>>> getTopHeadlinesLocal() async {
    try {
      var response = await homeLocalDataSource.getTopHeadlinesLocal();
      return Right(
        response,
      );
    } on HiveError catch (error) {
      return Left(
        HiveFailure(
          mess: error.message,
        ),
      );
    }
  }
}
