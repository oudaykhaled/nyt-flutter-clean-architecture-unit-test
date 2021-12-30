import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_flutter/articles_list/data/model/article.dart';
import 'package:nyt_flutter/articles_list/data/model/most_popular_response.dart';
import 'package:nyt_flutter/articles_list/data/remote/service/article_service.dart';
import 'package:nyt_flutter/articles_list/data/remote/source/article_remote_data_source_impl.dart';

import 'article_service_impl_test.mocks.dart';

class MockArticleService extends Mock implements ArticleService {}

@GenerateMocks(<Type>[MockArticleService])
void main() {
  late MockMockArticleService mockArticleService;
  late final List<Article> articles = <Article>[
    Article('title', 'abstract', 123, 'url', 'publishedData', <Media>[
      Media('caption', <MediaMetaData>[MediaMetaData('url', 'format')])
    ])
  ];

  setUp(() {
    mockArticleService = MockMockArticleService();
  });

  test('requestNews should fetch news', () async {
    when(mockArticleService.getTasks(any))
        .thenAnswer((_) async => MostPopularResponse('', '', articles));
    final ArticleRemoteDataSourceImpl articleRemoteDataSource =
        ArticleRemoteDataSourceImpl(mockArticleService);
    final MostPopularResponse response = await articleRemoteDataSource.getTasks('');
    expect(articles, response.articles);
  });

  test('requestNews should fetch news', () async {
    when(mockArticleService.getTasks(any))
        .thenThrow(DioError(requestOptions: RequestOptions(path: '')));
    final ArticleRemoteDataSourceImpl articleRemoteDataSource =
        ArticleRemoteDataSourceImpl(mockArticleService);
    try {
      await articleRemoteDataSource.getTasks('');
      assert(false);
    } catch (exception) {
      assert(true);
    }
  });
}
