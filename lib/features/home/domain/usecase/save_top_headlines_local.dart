import 'package:dartz/dartz.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';

class SaveTopHeadlinesLocal
    implements UseCase<String, RequestTopHeadlinesLocalParams> {
  final HomeRepository homeRepository;

  SaveTopHeadlinesLocal({
    required this.homeRepository,
  });

  @override
  Future<Either<HiveFailure, String>> call(
    RequestTopHeadlinesLocalParams params,
  ) async =>
      await homeRepository.saveTopHeadlinesLocal(
        params.articles,
      );
}
