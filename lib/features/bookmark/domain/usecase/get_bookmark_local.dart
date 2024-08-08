import 'package:dartz/dartz.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

class GetBookmarkLocal implements UseCase<List<ArticleModel>, NoParams> {
  final BookmarkRepository bookmarkRepository;

  GetBookmarkLocal({
    required this.bookmarkRepository,
  });

  @override
  Future<Either<HiveFailure, List<ArticleModel>>> call(
    NoParams params,
  ) async =>
      await bookmarkRepository.getBookmarksLocal();
}
