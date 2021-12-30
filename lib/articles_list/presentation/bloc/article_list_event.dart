part of 'article_list_bloc.dart';

@freezed
class ArticleListEvent with _$ArticleListEvent {
  const factory ArticleListEvent.loadArticles() = LoadArticles;
}
