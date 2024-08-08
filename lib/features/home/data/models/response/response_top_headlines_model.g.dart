// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_top_headlines_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseTopHeadlinesModel _$ResponseTopHeadlinesModelFromJson(
        Map<String, dynamic> json) =>
    ResponseTopHeadlinesModel(
      totalResults: (json['totalResults'] as num?)?.toInt(),
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseTopHeadlinesModelToJson(
        ResponseTopHeadlinesModel instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
