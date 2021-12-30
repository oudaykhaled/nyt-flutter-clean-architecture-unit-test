import 'package:flutter/material.dart';

import 'article_detail/presentation/screen/article_detail.dart';
import 'articles_list/data/model/article.dart';
import 'articles_list/presentation/screen/articles_list_screen.dart';
import 'di/di_setup.dart';

Future<dynamic> main() async {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ArticlesListScreen(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        ArticleDetail.routeKey: (BuildContext context) => ArticleDetail(
            ModalRoute.of(context)!.settings.arguments! as Article),
      },
    );
  }
}
