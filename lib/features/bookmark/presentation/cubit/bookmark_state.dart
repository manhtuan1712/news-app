part of 'bookmark_cubit.dart';

@immutable
abstract class BookmarkState {}

class BookmarkInitialState extends BookmarkState {}

class BookmarkLoadingState extends BookmarkState {}

class BookmarkGetLocalSuccessState extends BookmarkState {
  final List<ArticleModel> articles;

  BookmarkGetLocalSuccessState({
    required this.articles,
  });
}

class BookmarkGetLocalFailureState extends BookmarkState {
  final String error;

  BookmarkGetLocalFailureState({
    required this.error,
  });
}
