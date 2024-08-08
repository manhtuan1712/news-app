import 'package:dartz/dartz.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';

class GetTopHeadlinesLocal implements UseCase<List<ArticleModel>, NoParams> {
  final HomeRepository homeRepository;

  GetTopHeadlinesLocal({
    required this.homeRepository,
  });

  @override
  Future<Either<HiveFailure, List<ArticleModel>>> call(
    NoParams params,
  ) async =>
      await homeRepository.getTopHeadlinesLocal();
}
