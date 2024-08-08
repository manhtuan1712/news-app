import 'package:dartz/dartz.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/data/models/response/response_top_headlines_model.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';

class GetTopHeadlines
    implements UseCase<ResponseTopHeadlinesModel, RequestTopHeadlinesParams> {
  final HomeRepository homeRepository;

  GetTopHeadlines({
    required this.homeRepository,
  });

  @override
  Future<Either<ServerFailure, ResponseTopHeadlinesModel>> call(
    RequestTopHeadlinesParams params,
  ) async =>
      await homeRepository.getTopHeadlines(
        params.requests,
      );
}
