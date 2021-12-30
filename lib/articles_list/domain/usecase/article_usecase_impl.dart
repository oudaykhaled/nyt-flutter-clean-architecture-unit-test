import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error.dart';
import '../../data/model/most_popular_response.dart';
import '../repository/article_repo.dart';
import 'article_usecase.dart';

@Injectable(as: ArticleUseCase)
class ArticleUseCaseImpl implements ArticleUseCase {
  ArticleUseCaseImpl(this._articleRepo);

  final ArticleRepo _articleRepo;

  @override
  Future<Either<Error, MostPopularResponse>> requestNews() =>
      _articleRepo.requestNews();
}
