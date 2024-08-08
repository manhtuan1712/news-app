import 'package:hive/hive.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/core/helpers/enums.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

abstract class HomeLocalDataSource {
  Future<String> saveTopHeadlinesLocal(
    List<ArticleModel> articles,
  );

  Future<List<ArticleModel>> getTopHeadlinesLocal();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<String> saveTopHeadlinesLocal(
    List<ArticleModel> articles,
  ) async {
    try {
      if (articles.isNotEmpty) {
        await AppUtils.uploadBox.put(
          GlobalConfig.hiveArticles,
          articles,
        );
        return HiveSuccessCode.success.get();
      } else {
        return HiveSuccessCode.empty.get();
      }
    } on HiveError {
      return HiveSuccessCode.failed.get();
    }
  }

  @override
  Future<List<ArticleModel>> getTopHeadlinesLocal() async {
    try {
      List<dynamic> result = await AppUtils.uploadBox.get(
        GlobalConfig.hiveArticles,
      );
      List<ArticleModel> articles = result.cast<ArticleModel>();
      return articles;
    } on HiveError {
      return [];
    }
  }
}
