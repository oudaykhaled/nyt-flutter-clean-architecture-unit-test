import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error.dart';
import '../../data/model/article.dart';
import '../../data/model/most_popular_response.dart';
import '../../domain/usecase/article_usecase.dart';

part 'article_list_bloc.freezed.dart';

part 'article_list_event.dart';

part 'article_list_state.dart';

@injectable
class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  ArticleListBloc(this._articleUseCase) : super(ArticleListState.initial()) {
    on<ArticleListEvent>(
        (ArticleListEvent event, Emitter<ArticleListState> emit) async {
      await event.when(
        loadArticles: () => loadArticles(emit),
        markAsFavorite: (Article article) => markAsFavorite(emit, article),
        unMarkAsFavorite: (Article article) => unMarkAsFavorite(emit, article),
      );
    });
  }

  final ArticleUseCase _articleUseCase;

  Future<dynamic> loadArticles(Emitter<ArticleListState> emit) async {
    emit(state.copyWith(isLoading: true, articles: none()));
    final Either<Error, MostPopularResponse> result =
        await _articleUseCase.requestNews();
    emit(result.fold(
        (Error error) => state.copyWith(isLoading: false, articles: none()),
        (MostPopularResponse response) => state.copyWith(
            isLoading: false, articles: optionOf(response.articles))));
  }

  Future<dynamic> markAsFavorite(
      Emitter<ArticleListState> emit, Article article) async {}

  Future<dynamic> unMarkAsFavorite(
      Emitter<ArticleListState> emit, Article article) async {}
}
