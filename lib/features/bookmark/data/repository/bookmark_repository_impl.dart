import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/features/bookmark/data/datasource/bookmark_local_data_source.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkLocalDataSource bookmarkLocalDataSource;

  BookmarkRepositoryImpl({
    required this.bookmarkLocalDataSource,
  });

  @override
  Future<Either<HiveFailure, List<ArticleModel>>> getBookmarksLocal() async {
    try {
      var response = await bookmarkLocalDataSource.getBookmarksLocal();
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
  Future<Either<HiveFailure, List<ArticleModel>>> saveBookmarkLocal(
    ArticleModel article,
    bool isRemove,
  ) async {
    try {
      var response = await bookmarkLocalDataSource.saveBookmarkLocal(
        article,
        isRemove,
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
}
