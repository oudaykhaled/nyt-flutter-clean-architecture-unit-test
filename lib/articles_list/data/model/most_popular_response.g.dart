// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_popular_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MostPopularResponse _$MostPopularResponseFromJson(Map<String, dynamic> json) =>
    MostPopularResponse(
      json['status'] as String,
      json['copyright'] as String,
      (json['results'] as List<dynamic>?)
              ?.map((dynamic e) => Article.fromJson(e as Map<String, dynamic>))
              .toList() ??
          <Article>[],
    );

Map<String, dynamic> _$MostPopularResponseToJson(
        MostPopularResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'results': instance.articles,
    };
