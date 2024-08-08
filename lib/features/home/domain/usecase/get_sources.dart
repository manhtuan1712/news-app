import 'package:dartz/dartz.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/data/models/response/response_sources_model.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';

class GetSources implements UseCase<ResponseSourcesModel, NoParams> {
  final HomeRepository homeRepository;

  GetSources({
    required this.homeRepository,
  });

  @override
  Future<Either<ServerFailure, ResponseSourcesModel>> call(
    NoParams params,
  ) async =>
      await homeRepository.getSources();
}
