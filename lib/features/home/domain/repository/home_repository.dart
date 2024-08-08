import 'package:dartz/dartz.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/features/home/data/models/request/request_top_headlines_model.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';
import 'package:news_app/features/home/data/models/response/response_sources_model.dart';
import 'package:news_app/features/home/data/models/response/response_top_headlines_model.dart';

abstract class HomeRepository {
  Future<Either<ServerFailure, ResponseTopHeadlinesModel>> getTopHeadlines(
    RequestTopHeadlinesModel request,
  );

  Future<Either<ServerFailure, ResponseSourcesModel>> getSources();

  Future<Either<HiveFailure, String>> saveTopHeadlinesLocal(
    List<ArticleModel> articles,
  );

  Future<Either<HiveFailure, List<ArticleModel>>> getTopHeadlinesLocal();
}
