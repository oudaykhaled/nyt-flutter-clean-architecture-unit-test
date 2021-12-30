import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_flutter/articles_list/data/model/article.dart';
import 'package:nyt_flutter/articles_list/data/model/most_popular_response.dart';
import 'package:nyt_flutter/articles_list/domain/repository/article_repo.dart';
import 'package:nyt_flutter/articles_list/domain/usecase/article_usecase_impl.dart';
import 'package:nyt_flutter/core/error.dart';
import 'article_usecase_impl_test.mocks.dart';

class MockArticleRepo extends Mock implements ArticleRepo {}

@GenerateMocks(<Type>[MockArticleRepo])
void main() {
  late MockMockArticleRepo mockRepo;
  late final List<Article> articles = <Article>[
    Article('title', 'abstract', 123, 'url', 'publishedData', <Media>[
      Media('caption', <MediaMetaData>[MediaMetaData('url', 'format')])
    ])
  ];

  setUp(() {
    mockRepo = MockMockArticleRepo();
  });

  test('requestNews should fetch news', () async {
    when(mockRepo.requestNews())
        .thenAnswer((_) async => right(MostPopularResponse('', '', articles)));
    final ArticleUseCaseImpl articleRepo = ArticleUseCaseImpl(mockRepo);
    final Either<Error, MostPopularResponse> response = await articleRepo.requestNews();
    expect(articles, response.toOption().toNullable()?.articles);
  });

  test('requestNews should return error when repo throw an exception',
      () async {
    when(mockRepo.requestNews())
        .thenAnswer((_) async => left(const Error.httpUnAuthorizedError()));
    final ArticleUseCaseImpl articleRepo = ArticleUseCaseImpl(mockRepo);
    final Either<Error, MostPopularResponse> response =
        await articleRepo.requestNews();
    assert(response.isLeft());
  });
}
