import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/bookmark/domain/usecase/get_bookmark_local.dart';
import 'package:news_app/features/bookmark/domain/usecase/save_bookmark_local.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';
import 'package:news_app/features/home/presentation/cubit/home_article_cubit.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  SaveBookmarkLocal saveBookmarkLocal;

  GetBookmarkLocal getBookmarkLocal;

  BookmarkCubit({
    required this.saveBookmarkLocal,
    required this.getBookmarkLocal,
  }) : super(
          BookmarkInitialState(),
        );

  List<ArticleModel> bookMarks = [];

  Future<void> getBookmarkLocalAction() async {
    final result = await getBookmarkLocal.call(
      NoParams(),
    );
    result.fold(
      (l) => emit(
        BookmarkGetLocalFailureState(
          error: l.mess ?? '',
        ),
      ),
      (r) {
        bookMarks = r;
        emit(
          BookmarkGetLocalSuccessState(
            articles: r,
          ),
        );
      },
    );
  }

  Future<void> saveBookmarkLocalAction(
    ArticleModel article,
    bool isRemove,
  ) async {
    final result = await saveBookmarkLocal.call(
      RequestBookmarkLocalParams(
        article: article,
        isRemove: isRemove,
      ),
    );
    result.fold(
      (l) => emit(
        BookmarkGetLocalFailureState(
          error: l.mess ?? '',
        ),
      ),
      (r) {
        bookMarks = r;
        AppUtils.contextMain.read<HomeArticleCubit>().updateBookmark(
              bookMarks,
            );
        emit(
          BookmarkGetLocalSuccessState(
            articles: r,
          ),
        );
      },
    );
  }
}
