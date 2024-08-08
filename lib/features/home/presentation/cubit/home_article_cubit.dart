import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/bookmark/presentation/cubit/bookmark_cubit.dart';
import 'package:news_app/features/home/data/models/request/request_top_headlines_model.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';
import 'package:news_app/features/home/domain/usecase/get_top_headlines.dart';
import 'package:news_app/features/home/domain/usecase/get_top_headlines_local.dart';
import 'package:news_app/features/home/domain/usecase/save_top_headlines_local.dart';

part 'home_article_state.dart';

class HomeArticleCubit extends Cubit<HomeArticleState> {
  GetTopHeadlines getTopHeadlines;

  SaveTopHeadlinesLocal saveTopHeadlinesLocal;

  GetTopHeadlinesLocal getTopHeadlinesLocal;

  HomeArticleCubit({
    required this.getTopHeadlines,
    required this.saveTopHeadlinesLocal,
    required this.getTopHeadlinesLocal,
  }) : super(HomeArticleInitialState());

  List<ArticleModel> _articles = [];

  Future<void> getTopHeadlinesAction(
    String q,
    int currentPage,
    String source,
  ) async {
    emit(
      HomeArticleLoadingState(),
    );
    final result = await getTopHeadlines(
      RequestTopHeadlinesParams(
        requests: RequestTopHeadlinesModel(
          q: q,
          page: currentPage,
          pageSize: GlobalConfig.pageSize,
          country: '',
          category: '',
          sources: source,
        ),
      ),
    );
    result.fold(
      (l) {
        _getTopHeadlinesLocal();
        emit(
          HomeGetTopHeadLinesFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        saveTopHeadlinesLocal.call(
          RequestTopHeadlinesLocalParams(
            articles: r.articles?.sublist(
                  0,
                  9,
                ) ??
                [],
          ),
        );
        _articles = r.articles ?? [];
        updateBookmark(
          AppUtils.contextMain.read<BookmarkCubit>().bookMarks,
        );
        emit(
          HomeGetTopHeadLinesSuccessState(
            articles: r.articles,
            totalResults: r.totalResults,
            currentPage: currentPage,
          ),
        );
      },
    );
  }

  Future<void> _getTopHeadlinesLocal() async {
    final result = await getTopHeadlinesLocal.call(
      NoParams(),
    );
    result.fold(
      (l) => emit(
        HomeGetTopHeadLinesFailureState(
          error: l.mess,
        ),
      ),
      (r) {
        emit(
          HomeGetTopHeadLinesSuccessState(
            articles: r,
            totalResults: 10,
            currentPage: 1,
          ),
        );
      },
    );
  }

  void updateBookmark(List<ArticleModel> bookmarks) {
    Set<String> bookmarkedIds = bookmarks.map((b) => b.title ?? '').toSet();

    for (ArticleModel articleModel in _articles) {
      if (bookmarkedIds.contains(articleModel.title)) {
        articleModel.isBookmark = true;
      } else {
        articleModel.isBookmark = false;
      }
    }
    emit(
      HomeGetTopHeadLinesSuccessState(
        articles: _articles,
        totalResults: 10,
        currentPage: 1,
      ),
    );
  }
}
