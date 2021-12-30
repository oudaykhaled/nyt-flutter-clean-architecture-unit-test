import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di_setup.dart';
import '../../data/model/article.dart';
import '../bloc/article_list_bloc.dart';
import '../widget/article_list_item.dart';

class ArticlesListScreen extends StatefulWidget {
  const ArticlesListScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ArticlesListScreen> createState() => _ArticlesListScreenState();
}

class _ArticlesListScreenState extends State<ArticlesListScreen> {
  late final ArticleListBloc _articleListBloc;

  @override
  void initState() {
    super.initState();
    _articleListBloc = getIt<ArticleListBloc>();
    _articleListBloc.add(const ArticleListEvent.loadArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles list'),
      ),
      body: BlocProvider<ArticleListBloc>(
          create: (_) => _articleListBloc,
          child: BlocBuilder<ArticleListBloc, ArticleListState>(
            builder: (BuildContext context, ArticleListState state) {
              return getArticleList(context);
            },
          )),
    );
  }

  Widget getArticleList(BuildContext context) {
    return BlocBuilder<ArticleListBloc, ArticleListState>(
        builder: (BuildContext context, ArticleListState state) {
      if (state.isLoading) {
        return const Center(
          child: Text('Loading'),
        );
      } else {
        return state.articles.fold(
            () => Center(
                  child: TextButton(
                    onPressed: () {
                      _articleListBloc
                          .add(const ArticleListEvent.loadArticles());
                    },
                    child: const Text('Retry'),
                  ),
                ),
            drawArticles);
      }
    });
  }

  Widget drawArticles(List<Article> articles) {
    return ListView.builder(
      key: const Key('ArticlesList'),
      itemBuilder: (BuildContext context, int index) {
        return ArticleListItem(
          key: Key('ArticlesList_Item_$index'),
          article: articles[index],
        );
      },
      itemCount: articles.length,
    );
  }
}
