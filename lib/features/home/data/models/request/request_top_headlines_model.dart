import 'package:json_annotation/json_annotation.dart';

part 'request_top_headlines_model.g.dart';

@JsonSerializable()
class RequestTopHeadlinesModel {
  final String? country;

  final String? q;

  final int? pageSize;

  final int? page;

  final String? category;

  final String? sources;

  RequestTopHeadlinesModel({
    this.country,
    this.q,
    this.pageSize,
    this.page,
    this.category,
    this.sources,
  });

  factory RequestTopHeadlinesModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTopHeadlinesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTopHeadlinesModelToJson(this);
}
