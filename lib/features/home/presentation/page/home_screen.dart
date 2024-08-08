import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_app/core/base/widget/base_text_field_widget.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';
import 'package:news_app/features/home/data/models/response/source_model.dart';
import 'package:news_app/features/home/presentation/cubit/home_article_cubit.dart';
import 'package:news_app/features/home/presentation/cubit/home_source_cubit.dart';
import 'package:news_app/features/home/presentation/widget/home_body_empty_widget.dart';
import 'package:news_app/features/home/presentation/widget/home_body_widget.dart';
import 'package:news_app/features/home/presentation/widget/home_header_widget.dart';
import 'package:news_app/features/home/presentation/widget/home_source_selection_widget.dart';
import 'package:news_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:news_app/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  Timer? _debounce;

  String _sourceId = 'abc-news';

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<HomeArticleCubit>().getTopHeadlinesAction(
              '',
              1,
              _sourceId,
            );
        context.read<HomeSourceCubit>().getSourcesAction();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: BlocSelector<ProfileCubit, ProfileState, User?>(
            selector: (state) {
              if (state is ProfileGetCurrentUserState) {
                return state.user;
              }
              return null;
            },
            builder: (context, user) => HomeHeaderWidget(
              user: user,
            ),
          ),
        ),
        BlocSelector<HomeSourceCubit, HomeSourceState, List<SourceModel>?>(
          selector: (state) {
            if (state is HomeSourceGetSuccessState) {
              return state.sources;
            }
            return null;
          },
          builder: (context, sources) => HomeSourceSelectionWidget(
            sources: sources ?? [],
            onSourceSelected: (value) {
              _sourceId = value.id!;
              context.read<HomeArticleCubit>().getTopHeadlinesAction(
                    _searchController.text,
                    1,
                    _sourceId,
                  );
              setState(() {});
            },
            sourceIdSelected: _sourceId,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: BaseTextFieldWidget(
            textEditingController: _searchController,
            height: 45.0,
            hintText: S.of(context).mainSearch,
            background: Theme.of(context).colorScheme.scrim,
            padding: const EdgeInsets.only(
              left: 16.0,
            ),
            colorText: Theme.of(context).colorScheme.surfaceDim,
            suffix: _searchController.text.isNotEmpty
                ? Icon(
                    Icons.cancel,
                    color: Theme.of(context).colorScheme.surface,
                  )
                : null,
            onTapSuffix: () {
              _searchController.clear();
              context.read<HomeArticleCubit>().getTopHeadlinesAction(
                    '',
                    1,
                    _sourceId,
                  );
              setState(() {});
            },
            rightPosition: 16.0,
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce!.cancel();
              _debounce = Timer(
                const Duration(
                  milliseconds: 500,
                ),
                () {
                  context.read<HomeArticleCubit>().getTopHeadlinesAction(
                        value,
                        1,
                        _sourceId,
                      );
                },
              );
              setState(() {});
            },
          ),
        ),
        BlocSelector<HomeArticleCubit, HomeArticleState, List<ArticleModel>?>(
          selector: (state) {
            if (state is HomeGetTopHeadLinesSuccessState) {
              EasyLoading.dismiss();
              return state.articles;
            } else {
              EasyLoading.show();
              return null;
            }
          },
          builder: (context, articles) {
            return Expanded(
              child: articles?.isEmpty ?? false
                  ? const HomeBodyEmptyWidget()
                  : HomeBodyWidget(
                      articles: articles ?? [],
                      onRefresh: () => context
                          .read<HomeArticleCubit>()
                          .getTopHeadlinesAction(
                            '',
                            1,
                            _sourceId,
                          ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
