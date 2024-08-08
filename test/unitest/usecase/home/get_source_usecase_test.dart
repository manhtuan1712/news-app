import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/data/models/response/response_sources_model.dart';
import 'package:news_app/features/home/data/models/response/source_model.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';
import 'package:news_app/features/home/domain/usecase/get_sources.dart';

import 'get_source_usecase_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<HomeRepository>(
      as: #MockHomeRepository,
    ),
  ],
)
void main() {
  late MockHomeRepository mockHomeRepository;

  late GetSources getSources;

  final List<SourceModel> sources = <SourceModel>[
    SourceModel(
      id: 'abc-news',
      name: 'ABC News',
    ),
    SourceModel(
      id: 'abc-news-au',
      name: 'ABC News (AU)',
    ),
    SourceModel(
      id: 'aftenposten',
      name: 'Aftenposten',
    ),
    SourceModel(
      id: 'al-jazeera-english',
      name: 'Al Jazeera English',
    ),
  ];

  setUp(
    () {
      mockHomeRepository = MockHomeRepository();
      getSources = GetSources(
        homeRepository: mockHomeRepository,
      );
    },
  );

  // ---------- Get sources ---------- //
  test(
    'Get sources api and throw DioException',
    () async {
      when(
        mockHomeRepository.getSources(),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
        ),
      );
      try {
        await getSources.call(
          NoParams(),
        );
        assert(false);
      } catch (exception) {
        assert(true);
      }
    },
  );

  test(
    'Get sources api and return source list',
    () async {
      when(
        mockHomeRepository.getSources(),
      ).thenAnswer(
        (_) async => right(
          ResponseSourcesModel(
            sources: sources,
          ),
        ),
      );
      final Either<ServerFailure, ResponseSourcesModel> response =
          await getSources.call(
        NoParams(),
      );
      expect(
        sources,
        response.toOption().toNullable()?.sources,
      );
    },
  );
}
