import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_flutter/articles_list/data/model/article.dart';
import 'package:nyt_flutter/articles_list/data/model/most_popular_response.dart';
import 'package:nyt_flutter/articles_list/data/remote/source/article_remote_data_source.dart';
import 'package:nyt_flutter/articles_list/data/repository/article_repo_impl.dart';
import 'package:nyt_flutter/core/error.dart';
import 'article_repo_impl_test.mocks.dart';

class MockArticleRemoteDataSource extends Mock
    implements ArticleRemoteDataSource {}

@GenerateMocks(<Type>[MockArticleRemoteDataSource])
void main() {
  late MockMockArticleRemoteDataSource mockDataSource;
  late final List<Article> articles = <Article>[
    Article('title', 'abstract', 123, 'url', 'publishedData', <Media>[
      Media('caption', <MediaMetaData>[
        MediaMetaData('url', 'format')
      ])
    ])
  ];

  setUp(() {
    mockDataSource = MockMockArticleRemoteDataSource();
  });

  test('requestNews should fetch news', () async {
    when(mockDataSource.getTasks(any))
        .thenAnswer((_) async => MostPopularResponse('', '', articles));
    final ArticleRepoImpl articleRepo = ArticleRepoImpl(mockDataSource);
    final Either<Error, MostPopularResponse> response = await articleRepo.requestNews();
    expect(articles, response.toOption().toNullable()?.articles);
  });

  test('requestNews should fetch news with correct fields', () async {
    when(mockDataSource.getTasks(any))
        .thenAnswer((_) async => MostPopularResponse('', '', articles));
    final ArticleRepoImpl articleRepo = ArticleRepoImpl(mockDataSource);
    final Either<Error, MostPopularResponse> response = await articleRepo.requestNews();
    expect(articles, response.toOption().toNullable()?.articles);
    expect(response.toOption().toNullable()?.articles.first.title, 'title');
    expect(response.toOption().toNullable()?.articles.first.abstract, 'abstract');
    expect(response.toOption().toNullable()?.articles.first.url, 'url');
    expect(response.toOption().toNullable()?.articles.first.id, 123);
    expect(response.toOption().toNullable()?.articles.first.publishedData, 'publishedData');
    expect(response.toOption().toNullable()?.articles.first.media.first.caption, 'caption');
    expect(response.toOption().toNullable()?.articles.first.media.first.metaData.first.url, 'url');
    expect(response.toOption().toNullable()?.articles.first.media.first.metaData.first.format, 'format');
  });

  test('Article model serialization/deserialization should work properly', () async {
    final Map<String, dynamic> map = Article('title', 'abstract', 123, 'url', 'publishedData', <Media>[]).toJson();
    final Article article = Article.fromJson(map);
    expect(article.title, 'title');
    expect(article.abstract, 'abstract');
    expect(article.url, 'url');
    expect(article.id, 123);
    expect(article.publishedData, 'publishedData');
    expect(article.media, <Media>[]);
  });

  test('Media model serialization/deserialization should work properly', () async {
    final Map<String, dynamic> map = Media('caption', <MediaMetaData>[]).toJson();
    final Media media = Media.fromJson(map);
    expect(media.caption, 'caption');
    expect(media.metaData, <MetaData>[]);
  });

  test('Media model serialization/deserialization should work properly', () async {
    final Map<String, dynamic> map = MediaMetaData('url', 'format').toJson();
    final MediaMetaData mediaMetaData = MediaMetaData.fromJson(map);
    expect(mediaMetaData.url, 'url');
    expect(mediaMetaData.format, 'format');
  });

  test('requestNews should return error when repo throw an exception', () async {
    when(mockDataSource.getTasks(any))
        .thenThrow(DioError(requestOptions: RequestOptions(path: '')));
    final ArticleRepoImpl articleRepo = ArticleRepoImpl(mockDataSource);
    final Either<Error, MostPopularResponse> response = await articleRepo.requestNews();
    assert(response.isLeft());
  });

  test('requestNews should return httpUnAuthorizedError error when repo throws an 403 exception', () async {
    when(mockDataSource.getTasks(any))
        .thenThrow(
        DioError(
            type: DioErrorType.response,
            requestOptions: RequestOptions(path: ''),
            response: Response<MostPopularResponse>(requestOptions: RequestOptions(path: ''), statusCode: 401)
        ));
    final ArticleRepoImpl articleRepo = ArticleRepoImpl(mockDataSource);
    final Either<Error, MostPopularResponse> response = await articleRepo.requestNews();
    response.fold(
            (Error exception) {
              expect(exception, const Error.httpUnAuthorizedError());
            },
            (MostPopularResponse data) {assert(false);});
  });

  test('requestNews should return HttpInternalServerError error when repo throws an 503 exception', () async {
    when(mockDataSource.getTasks(any))
        .thenThrow(
        DioError(
            type: DioErrorType.response,
            requestOptions: RequestOptions(path: ''),
            response: Response<MostPopularResponse>(requestOptions: RequestOptions(path: ''), statusCode: 503)
        ));
    final ArticleRepoImpl articleRepo = ArticleRepoImpl(mockDataSource);
    final Either<Error, MostPopularResponse> response = await articleRepo.requestNews();
    response.fold(
            (Error exception) {
              assert(exception is HttpInternalServerError);
            },
            (MostPopularResponse data) {assert(false);});
  });

}
