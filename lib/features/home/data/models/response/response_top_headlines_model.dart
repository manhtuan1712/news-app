import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/core/base/model/base_response_model.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

part 'response_top_headlines_model.g.dart';

@JsonSerializable()
class ResponseTopHeadlinesModel extends BaseResponseModel {
  final int? totalResults;

  final List<ArticleModel>? articles;

  ResponseTopHeadlinesModel({
    this.totalResults,
    this.articles,
  });

  factory ResponseTopHeadlinesModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseTopHeadlinesModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResponseTopHeadlinesModelToJson(this);
}
