// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      json['title'] as String,
      json['abstract'] as String,
      json['id'] as int,
      json['url'] as String,
      json['published_date'] as String?,
      (json['media'] as List<dynamic>)
          .map((dynamic media) => Media.fromJson(media as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'abstract': instance.abstract,
      'url': instance.url,
      'published_date': instance.publishedData,
      'media': instance.media,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      json['caption'] as String? ?? '',
      (json['media-metadata'] as List<dynamic>?)
              ?.map((dynamic media) => MediaMetaData.fromJson(media as Map<String, dynamic>))
              .toList() ?? <MediaMetaData>[],
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'caption': instance.caption,
      'media-metadata': instance.metaData,
    };

MediaMetaData _$MediaMetaDataFromJson(Map<String, dynamic> json) =>
    MediaMetaData(
      json['url'] as String? ?? '',
      json['format'] as String? ?? '',
    );

Map<String, dynamic> _$MediaMetaDataToJson(MediaMetaData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
    };
