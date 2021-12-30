import 'package:freezed_annotation/freezed_annotation.dart';
import 'article.dart';

part 'most_popular_response.g.dart';

@JsonSerializable()
class MostPopularResponse {
  MostPopularResponse(this.status, this.copyright, this.articles);

  factory MostPopularResponse.fromJson(Map<String, dynamic> json) =>
      _$MostPopularResponseFromJson(json);
  final String status, copyright;
  @JsonKey(name: 'results')
  final List<Article> articles;

  Map<String, dynamic> toJson() => _$MostPopularResponseToJson(this);
}
