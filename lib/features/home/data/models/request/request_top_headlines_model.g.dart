// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_top_headlines_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTopHeadlinesModel _$RequestTopHeadlinesModelFromJson(
        Map<String, dynamic> json) =>
    RequestTopHeadlinesModel(
      country: json['country'] as String?,
      q: json['q'] as String?,
      pageSize: (json['pageSize'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      category: json['category'] as String?,
      sources: json['sources'] as String?,
    );

Map<String, dynamic> _$RequestTopHeadlinesModelToJson(
        RequestTopHeadlinesModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'q': instance.q,
      'pageSize': instance.pageSize,
      'page': instance.page,
      'category': instance.category,
      'sources': instance.sources,
    };
