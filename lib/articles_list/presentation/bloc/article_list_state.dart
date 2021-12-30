part of 'article_list_bloc.dart';

@freezed
class ArticleListState with _$ArticleListState {
  const factory ArticleListState({
    @Default(false) bool isLoading,
    required Option<List<Article>> articles,
  }) = _ArticleListState;

  factory ArticleListState.initial() => ArticleListState(articles: none());
}
