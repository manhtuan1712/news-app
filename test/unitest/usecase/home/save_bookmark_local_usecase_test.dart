import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/bookmark/domain/usecase/get_bookmark_local.dart';
import 'package:news_app/features/bookmark/domain/usecase/save_bookmark_local.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

import 'get_bookmark_local_usecase_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<BookmarkRepository>(
      as: #MockBookmarkRepository,
    ),
  ],
)
void main() {
  late MockBookmarkRepository mockBookmarkRepository;

  late SaveBookmarkLocal saveBookmarkLocal;

  setUp(
    () {
      mockBookmarkRepository = MockBookmarkRepository();
      saveBookmarkLocal = SaveBookmarkLocal(
        bookmarkRepository: mockBookmarkRepository,
      );
    },
  );

  // ---------- Get bookmark local ---------- //
  test(
    'Save bookmark local and throw HiveError',
    () async {
      when(
        mockBookmarkRepository.saveBookmarkLocal(
          any,
          any,
        ),
      ).thenThrow(
        HiveError(
          '',
        ),
      );
      try {
        await saveBookmarkLocal.call(
          RequestBookmarkLocalParams(
            article: ArticleModel(),
            isRemove: false,
          ),
        );
        assert(false);
      } catch (exception) {
        assert(true);
      }
    },
  );
}
