import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/data/models/response/source_model.dart';
import 'package:news_app/features/home/domain/usecase/get_sources.dart';

part 'home_source_state.dart';

class HomeSourceCubit extends Cubit<HomeSourceState> {
  GetSources getSources;

  HomeSourceCubit({
    required this.getSources,
  }) : super(HomeSourceInitialState());

  Future<void> getSourcesAction() async {
    emit(HomeSourceLoadingState());
    final result = await getSources(
      NoParams(),
    );
    result.fold(
      (l) => emit(
        HomeSourceGetFailureState(
          error: l.mess,
        ),
      ),
      (r) => emit(
        HomeSourceGetSuccessState(
          sources: r.sources,
        ),
      ),
    );
  }
}
