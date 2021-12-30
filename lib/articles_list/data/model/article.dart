import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article(this.title, this.abstract, this.id, this.url, this.publishedData,
      this.media);

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  final int id;
  final String title, abstract, url;
  @JsonKey(name: 'published_date')
  final String? publishedData;
  final List<Media> media;
}

@JsonSerializable()
class Media {
  Media(this.caption, this.metaData);

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  @JsonKey(name: 'caption', defaultValue: '')
  final String caption;

  @JsonKey(name: 'media-metadata', defaultValue: <MediaMetaData>[])
  final List<MediaMetaData> metaData;

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
class MediaMetaData {
  MediaMetaData(this.url, this.format);

  factory MediaMetaData.fromJson(Map<String, dynamic> json) =>
      _$MediaMetaDataFromJson(json);

  @JsonKey(defaultValue: '')
  final String url;

  @JsonKey(defaultValue: '')
  final String format;

  Map<String, dynamic> toJson() => _$MediaMetaDataToJson(this);
}
