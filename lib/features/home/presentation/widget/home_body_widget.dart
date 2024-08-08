import 'package:flutter/material.dart';
import 'package:news_app/core/base/widget/base_article_widget.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

class HomeBodyWidget extends StatelessWidget {
  final List<ArticleModel> articles;

  final Function onRefresh;

  const HomeBodyWidget({
    super.key,
    required this.articles,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 32.0,
      ),
      child: RefreshIndicator(
        onRefresh: () => onRefresh(),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 24.0,
          ),
          itemBuilder: (context, index) => BaseArticleWidget(
            articleModel: articles[index],
          ),
          itemCount: articles.length,
        ),
      ),
    );
  }
}
