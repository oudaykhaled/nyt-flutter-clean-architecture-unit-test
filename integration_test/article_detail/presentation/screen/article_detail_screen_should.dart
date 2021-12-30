import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nyt_flutter/article_detail/presentation/screen/article_detail.dart';
import 'package:nyt_flutter/articles_list/data/model/article.dart';
import 'package:nyt_flutter/common/constant.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('show title', (WidgetTester tester) async {
    await tester.pumpWidget(getArticleDetailWidget(mockArticle));
    await tester.pumpAndSettle();
    expect(find.text('Article title'), findsOneWidget);
  });

  testWidgets('show description', (WidgetTester tester) async {
    await tester.pumpWidget(getArticleDetailWidget(mockArticle));
    await tester.pumpAndSettle();
    expect(find.text('abstract'), findsOneWidget);
  });

  testWidgets('show image', (WidgetTester tester) async {
    await tester.pumpWidget(getArticleDetailWidget(mockArticle));
    await tester.pumpAndSettle();
    final CachedNetworkImage articleImageWidget = tester
        .widget<CachedNetworkImage>(find.byKey(const Key('articleImage')));
    expect(articleImageWidget.imageUrl, mockImageUrl);
  });

  testWidgets(
      'show default image when 3rd image in model object does not exist',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(getArticleDetailWidget(mockArticleWithMissingImage));
    await tester.pumpAndSettle();
    final CachedNetworkImage articleImageWidget = tester
        .widget<CachedNetworkImage>(find.byKey(const Key('articleImage')));
    expect(articleImageWidget.imageUrl, defaultImage);
  });

  testWidgets('show default image when no metadata',
      (WidgetTester tester) async {
    await tester.pumpWidget(getArticleDetailWidget(mockArticleWithMetaData));
    await tester.pumpAndSettle();
    final CachedNetworkImage articleImageWidget = tester
        .widget<CachedNetworkImage>(find.byKey(const Key('articleImage')));
    expect(articleImageWidget.imageUrl, defaultImage);
  });
}

const String mockImageUrl =
    'https://media.istockphoto.com/photos/eagle-hunter-in-traditional-costume-riding-horse-with-golden-eagle-in-picture-id1343808526';

Article mockArticle =
    Article('Article title', 'abstract', 123, 'url', 'publishedData', <Media>[
  Media('caption', <MediaMetaData>[
    MediaMetaData('url', 'format'),
    MediaMetaData('url', 'format'),
    MediaMetaData(mockImageUrl, 'format'),
  ])
]);

Article mockArticleWithMissingImage =
    Article('Article title', 'abstract', 123, 'url', 'publishedData', <Media>[
  Media('caption', <MediaMetaData>[
    MediaMetaData('url', 'format'),
    MediaMetaData(mockImageUrl, 'format'),
  ])
]);

Article mockArticleWithMetaData = Article('Article title', 'abstract', 123,
    'url', 'publishedData', <Media>[Media('caption', <MediaMetaData>[])]);

MaterialApp getArticleDetailWidget(Article article) => MaterialApp(
      theme: ThemeData(),
      home: ArticleDetail(article),
    );
