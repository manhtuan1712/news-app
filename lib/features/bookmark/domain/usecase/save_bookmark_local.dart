import 'package:dartz/dartz.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

class SaveBookmarkLocal
    implements UseCase<List<ArticleModel>, RequestBookmarkLocalParams> {
  final BookmarkRepository bookmarkRepository;

  SaveBookmarkLocal({
    required this.bookmarkRepository,
  });

  @override
  Future<Either<HiveFailure, List<ArticleModel>>> call(
    RequestBookmarkLocalParams params,
  ) async =>
      await bookmarkRepository.saveBookmarkLocal(
        params.article,
        params.isRemove,
      );
}
