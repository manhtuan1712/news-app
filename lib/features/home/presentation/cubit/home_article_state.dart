part of 'home_article_cubit.dart';

@immutable
abstract class HomeArticleState {}

class HomeArticleInitialState extends HomeArticleState {}

class HomeArticleLoadingState extends HomeArticleState {}

class HomeGetTopHeadLinesSuccessState extends HomeArticleState {
  final List<ArticleModel>? articles;

  final int? totalResults;

  final int? currentPage;

  HomeGetTopHeadLinesSuccessState({
    this.articles,
    this.totalResults,
    this.currentPage,
  });
}

class HomeGetTopHeadLinesFailureState extends HomeArticleState {
  final String? error;

  HomeGetTopHeadLinesFailureState({
    this.error,
  });
}
