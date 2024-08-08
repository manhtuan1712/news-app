import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/core/base/model/base_response_model.dart';
import 'package:news_app/features/home/data/models/response/source_model.dart';

part 'response_sources_model.g.dart';

@JsonSerializable()
class ResponseSourcesModel extends BaseResponseModel {
  List<SourceModel>? sources;

  ResponseSourcesModel({
    this.sources,
  });

  factory ResponseSourcesModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseSourcesModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResponseSourcesModelToJson(this);
}
