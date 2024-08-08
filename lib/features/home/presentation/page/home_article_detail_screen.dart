import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/features/bookmark/presentation/cubit/bookmark_cubit.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:share_plus/share_plus.dart';

class HomeArticleDetailScreen extends StatefulWidget {
  final ArticleModel articleModel;

  final String type;

  const HomeArticleDetailScreen({
    super.key,
    required this.articleModel,
    required this.type,
  });

  @override
  State<HomeArticleDetailScreen> createState() =>
      _HomeArticleDetailScreenState();
}

class _HomeArticleDetailScreenState extends State<HomeArticleDetailScreen> {
  late bool _isBookmark;

  @override
  void initState() {
    super.initState();
    _isBookmark = widget.articleModel.isBookmark ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 40.0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              8.0,
            ),
            topRight: Radius.circular(
              8.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.surfaceDim,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    _isBookmark = !_isBookmark;
                    await context.read<BookmarkCubit>().saveBookmarkLocalAction(
                          widget.articleModel,
                          !_isBookmark,
                        );
                    setState(() {});
                  },
                  icon: Icon(
                    _isBookmark ? Icons.bookmark : Icons.bookmark_border,
                    color: Theme.of(context).colorScheme.surfaceDim,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                IconButton(
                  onPressed: () => Share.share(
                    '${S.of(context).articleDetailCheckOut} ${widget.articleModel.url}',
                  ),
                  icon: Icon(
                    Icons.share,
                    color: Theme.of(context).colorScheme.surfaceDim,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: '${widget.articleModel.urlToImage}-${widget.type}',
              child: CachedNetworkImage(
                imageUrl: widget.articleModel.urlToImage ?? '',
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fitWidth,
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.articleModel.title ?? '',
                    style: AppConstants.textHeadingH4.copyWith(
                      color: Theme.of(context).colorScheme.surfaceDim,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Wrap(
                    children: [
                      Visibility(
                        visible: widget.articleModel.author != null,
                        child: Text(
                          '${widget.articleModel.author} · ',
                          style: AppConstants.textFootNoteRegular.copyWith(
                            color: Theme.of(context).colorScheme.surfaceTint,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat(GlobalConfig.dateTimeFormatArticleDetail)
                            .format(
                          DateTime.parse(
                            widget.articleModel.publishedAt ?? '',
                          ),
                        ),
                        style: AppConstants.textFootNoteRegular.copyWith(
                          color: Theme.of(context).colorScheme.surfaceTint,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    widget.articleModel.content ?? '',
                    style: AppConstants.textBody1Regular.copyWith(
                      color: Theme.of(context).colorScheme.surfaceTint,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
