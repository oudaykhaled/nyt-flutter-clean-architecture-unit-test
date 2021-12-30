import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../model/most_popular_response.dart';

part 'article_service.g.dart';

@RestApi()
@injectable
abstract class ArticleService {
  @factoryMethod
  factory ArticleService(Dio dio) = _ArticleService;

  @GET('mostpopular/v2/emailed/30.json')
  Future<MostPopularResponse> getTasks(@Query('api-key') String apiKey);
}
