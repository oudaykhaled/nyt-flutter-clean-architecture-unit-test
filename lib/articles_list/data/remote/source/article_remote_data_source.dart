import '../../model/most_popular_response.dart';

abstract class ArticleRemoteDataSource {
  Future<MostPopularResponse> getTasks(String apiKey);
}
