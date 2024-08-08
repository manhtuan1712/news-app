part of 'home_source_cubit.dart';

@immutable
abstract class HomeSourceState {}

class HomeSourceInitialState extends HomeSourceState {}

class HomeSourceLoadingState extends HomeSourceState {}

class HomeSourceGetSuccessState extends HomeSourceState {
  final List<SourceModel>? sources;

  HomeSourceGetSuccessState({
    this.sources,
  });
}

class HomeSourceGetFailureState extends HomeSourceState {
  final String? error;

  HomeSourceGetFailureState({
    this.error,
  });
}
