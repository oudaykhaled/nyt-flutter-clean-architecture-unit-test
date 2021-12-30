import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nyt_flutter/article_detail/presentation/screen/article_detail.dart';
import 'package:nyt_flutter/articles_list/data/model/article.dart';
import 'package:nyt_flutter/articles_list/data/model/most_popular_response.dart';
import 'package:nyt_flutter/articles_list/domain/usecase/article_usecase.dart';
import 'package:nyt_flutter/articles_list/presentation/screen/articles_list_screen.dart';
import 'package:nyt_flutter/core/error.dart';
import 'package:nyt_flutter/di/di_setup.dart';

const int numberOfArticles = 20;

void setupDiForSuccess() {
  GetIt.instance.allowReassignment = true;
  configureDependencies();
  GetIt.instance
      .registerSingleton<ArticleUseCase>(MockArticleListUseCaseSuccess());
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('show when widget start should show all articles',
      (WidgetTester tester) async {
    setupDiForSuccess();
    await tester.pumpWidget(getArticleListWidget());
    await tester.pumpAndSettle();
    final Finder articlesListFinder = find.byKey(const Key('ArticlesList'));
    expect(find.byKey(const Key('ArticlesList')), findsOneWidget);
    final ListView listWidget = tester.widget<ListView>(articlesListFinder);
    expect(listWidget.childrenDelegate.estimatedChildCount, numberOfArticles);
  });

  testWidgets('should show scroll vertically', (WidgetTester tester) async {
    setupDiForSuccess();
    await tester.pumpWidget(getArticleListWidget());
    await tester.pumpAndSettle();
    final Finder articlesListFinder = find.byType(Scrollable);
    final Finder targetItem =
        find.byKey(const Key('ArticlesList_Item_${numberOfArticles - 1}'));
    await tester.scrollUntilVisible(targetItem, 100,
        scrollable: articlesListFinder);
    await tester.pumpAndSettle();
    expect(find.text('title${numberOfArticles - 1}'), findsOneWidget);
  });

  testWidgets('should open article details screen when item tapped',
      (WidgetTester tester) async {
    setupDiForSuccess();
    await tester.pumpWidget(getArticleListWidget());
    await tester.pumpAndSettle();
    final Finder targetItem = find.byKey(const Key('ArticlesList_Item_1'));
    await tester.tap(targetItem);
    await tester.pumpAndSettle();
    expect(find.byType(MockScreen), findsOneWidget);
  });
}

List<Article> getMockArticles() {
  return List<Article>.generate(
      numberOfArticles,
      (int index) => Article('title$index', 'abstract$index', index, 'url$index',
              'publishedData', <Media>[
            Media('caption$index', <MediaMetaData>[MediaMetaData('url$index', 'format$index')])
          ]));
}

class MockArticleListUseCaseSuccess implements ArticleUseCase {
  @override
  Future<Either<Error, MostPopularResponse>> requestNews() async {
    return right(MostPopularResponse('', '', getMockArticles()));
  }
}

class MockArticleListUseCaseFailure implements ArticleUseCase {
  @override
  Future<Either<Error, MostPopularResponse>> requestNews() async {
    return left(const Error.httpInternalServerError(''));
  }
}

class MockScreen extends StatelessWidget {
  const MockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

MaterialApp getArticleListWidget() => MaterialApp(
      theme: ThemeData(),
      home: const ArticlesListScreen(title: 'Test Title'),
      routes: <String, WidgetBuilder>{
        ArticleDetail.routeKey: (BuildContext context) => const MockScreen(),
      },
    );
