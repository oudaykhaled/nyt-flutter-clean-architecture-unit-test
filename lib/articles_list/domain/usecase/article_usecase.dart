import 'package:dartz/dartz.dart';

import '../../../core/error.dart';
import '../../data/model/most_popular_response.dart';

abstract class ArticleUseCase {
  Future<Either<Error, MostPopularResponse>> requestNews();
}
