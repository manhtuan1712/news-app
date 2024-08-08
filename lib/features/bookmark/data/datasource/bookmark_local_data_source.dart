import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

abstract class BookmarkLocalDataSource {
  Future<List<ArticleModel>> saveBookmarkLocal(
    ArticleModel article,
    bool isRemove,
  );

  Future<List<ArticleModel>> getBookmarksLocal();
}

class BookmarkLocalDataSourceImpl implements BookmarkLocalDataSource {
  @override
  Future<List<ArticleModel>> saveBookmarkLocal(
    ArticleModel article,
    bool isRemove,
  ) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      List<dynamic>? result = await AppUtils.uploadBox.get(
        '${GlobalConfig.hiveBookmarks}-${user?.uid}',
      );
      List<ArticleModel> bookmarks = result?.cast<ArticleModel>() ?? [];
      if (isRemove) {
        bookmarks.removeWhere(
          (e) => e.title == article.title,
        );
      } else {
        bookmarks.add(
          article,
        );
      }
      await AppUtils.uploadBox.put(
        '${GlobalConfig.hiveBookmarks}-${user?.uid}',
        bookmarks,
      );
      return bookmarks;
    } on HiveError {
      return [];
    }
  }

  @override
  Future<List<ArticleModel>> getBookmarksLocal() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      List<dynamic>? result = await AppUtils.uploadBox.get(
        '${GlobalConfig.hiveBookmarks}-${user?.uid}',
      );
      List<ArticleModel> bookmarks = result?.cast<ArticleModel>() ?? [];
      return bookmarks;
    } on HiveError {
      return [];
    }
  }
}
