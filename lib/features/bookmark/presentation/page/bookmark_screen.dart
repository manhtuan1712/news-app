import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/base/widget/base_article_widget.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/core/helpers/enums.dart';
import 'package:news_app/features/bookmark/presentation/cubit/bookmark_cubit.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';
import 'package:news_app/features/home/presentation/widget/home_body_empty_widget.dart';
import 'package:news_app/generated/l10n.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  BookMarkScreenState createState() => BookMarkScreenState();
}

class BookMarkScreenState extends State<BookMarkScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<BookmarkCubit>().getBookmarkLocalAction(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        centerTitle: false,
        title: Text(
          S.of(context).mainBookMarkBottom,
          style: AppConstants.textHeadingH3.copyWith(
            color: Theme.of(context).colorScheme.surfaceDim,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 32.0,
        ),
        width: MediaQuery.sizeOf(context).width,
        child: BlocSelector<BookmarkCubit, BookmarkState, List<ArticleModel>?>(
          selector: (state) {
            if (state is BookmarkGetLocalSuccessState) {
              return state.articles;
            } else {
              return null;
            }
          },
          builder: (context, articles) {
            return articles?.isEmpty ?? false
                ? HomeBodyEmptyWidget(
                    text: S.of(context).mainCanNotFindBookmark,
                  )
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 24.0,
                    ),
                    itemBuilder: (context, index) => BaseArticleWidget(
                      type: ArticleType.bookmark.get(),
                      articleModel: articles![index],
                    ),
                    itemCount: articles?.length ?? 0,
                  );
          },
        ),
      ),
    );
  }
}
