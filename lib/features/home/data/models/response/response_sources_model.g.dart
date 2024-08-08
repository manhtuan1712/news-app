// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_sources_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSourcesModel _$ResponseSourcesModelFromJson(
        Map<String, dynamic> json) =>
    ResponseSourcesModel(
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => SourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseSourcesModelToJson(
        ResponseSourcesModel instance) =>
    <String, dynamic>{
      'sources': instance.sources,
    };
