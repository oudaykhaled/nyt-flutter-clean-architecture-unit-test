import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../common/constant.dart';

import '../../../core/error.dart';
import '../../domain/repository/article_repo.dart';
import '../model/most_popular_response.dart';
import '../remote/source/article_remote_data_source.dart';

@Injectable(as: ArticleRepo)
class ArticleRepoImpl implements ArticleRepo {
  ArticleRepoImpl(this._remoteDataSource);

  final ArticleRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Error, MostPopularResponse>> requestNews() async {
    try {
      final MostPopularResponse result =
          await _remoteDataSource.getTasks(apiKey);
      return right(result);
    } on DioError catch (exception) {
      if (exception.type == DioErrorType.response) {
        final int statusCode = exception.response!.statusCode ?? 503;
        if (statusCode == 401) {
          return left(const Error.httpUnAuthorizedError());
        } else {
          return left(HttpInternalServerError(exception.message));
        }
      }
      return left(HttpUnknownError(exception.message));
    }
  }
}
