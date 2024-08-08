import 'package:dartz/dartz.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

abstract class BookmarkRepository {
  Future<Either<HiveFailure, List<ArticleModel>>> saveBookmarkLocal(
    ArticleModel article,
    bool isRemove,
  );

  Future<Either<HiveFailure, List<ArticleModel>>> getBookmarksLocal();
}
