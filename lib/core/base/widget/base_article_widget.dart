import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/core/navigation/navigation_center.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';
import 'package:news_app/features/home/presentation/page/home_article_detail_screen.dart';

class BaseArticleWidget extends StatelessWidget {
  final ArticleModel articleModel;

  const BaseArticleWidget({
    super.key,
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => NavigationCenter.goToScreen(
        AppUtils.contextMain,
        NavigationCenter.homeArticleDetailScreen,
        HomeArticleDetailScreen(
          articleModel: articleModel,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articleModel.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppConstants.textHeadingH5.copyWith(
                    color: Theme.of(context).colorScheme.surfaceDim,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Wrap(
                  children: [
                    Visibility(
                      visible: articleModel.author != null,
                      child: Text(
                        '${articleModel.author} · ',
                        style: AppConstants.textFootNoteRegular.copyWith(
                          color: Theme.of(context).colorScheme.surfaceTint,
                        ),
                      ),
                    ),
                    Text(
                      DateFormat(GlobalConfig.dateTimeFormatArticle).format(
                        DateTime.parse(
                          articleModel.publishedAt ?? '',
                        ),
                      ),
                      style: AppConstants.textFootNoteRegular.copyWith(
                        color: Theme.of(context).colorScheme.surfaceTint,
                      ),
                    ),
                  ],
                ),
              ],
            ), /**/
          ),
          const SizedBox(
            width: 16.0,
          ),
          Hero(
            tag: articleModel.urlToImage ?? '',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              child: CachedNetworkImage(
                imageUrl: articleModel.urlToImage ?? '',
                width: 112.0,
                height: 80.0,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => SpinKitFadingCircle(
                  color: Theme.of(context).colorScheme.primary,
                  size: 30.0,
                ),
                placeholder: (context, url) => SpinKitFadingCircle(
                  color: Theme.of(context).colorScheme.primary,
                  size: 30.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
