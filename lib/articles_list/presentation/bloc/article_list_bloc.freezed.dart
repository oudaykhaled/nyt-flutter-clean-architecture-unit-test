// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'article_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ArticleListEventTearOff {
  const _$ArticleListEventTearOff();

  LoadArticles loadArticles() {
    return const LoadArticles();
  }

  MarkAsFavorite markAsFavorite(Article article) {
    return MarkAsFavorite(
      article,
    );
  }

  UnMarkAsFavorite unMarkAsFavorite(Article article) {
    return UnMarkAsFavorite(
      article,
    );
  }
}

/// @nodoc
const $ArticleListEvent = _$ArticleListEventTearOff();

/// @nodoc
mixin _$ArticleListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadArticles,
    required TResult Function(Article article) markAsFavorite,
    required TResult Function(Article article) unMarkAsFavorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadArticles,
    TResult Function(Article article)? markAsFavorite,
    TResult Function(Article article)? unMarkAsFavorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadArticles,
    TResult Function(Article article)? markAsFavorite,
    TResult Function(Article article)? unMarkAsFavorite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadArticles value) loadArticles,
    required TResult Function(MarkAsFavorite value) markAsFavorite,
    required TResult Function(UnMarkAsFavorite value) unMarkAsFavorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    TResult Function(MarkAsFavorite value)? markAsFavorite,
    TResult Function(UnMarkAsFavorite value)? unMarkAsFavorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    TResult Function(MarkAsFavorite value)? markAsFavorite,
    TResult Function(UnMarkAsFavorite value)? unMarkAsFavorite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleListEventCopyWith<$Res> {
  factory $ArticleListEventCopyWith(
          ArticleListEvent value, $Res Function(ArticleListEvent) then) =
      _$ArticleListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ArticleListEventCopyWithImpl<$Res>
    implements $ArticleListEventCopyWith<$Res> {
  _$ArticleListEventCopyWithImpl(this._value, this._then);

  final ArticleListEvent _value;
  // ignore: unused_field
  final $Res Function(ArticleListEvent) _then;
}

/// @nodoc
abstract class $LoadArticlesCopyWith<$Res> {
  factory $LoadArticlesCopyWith(
          LoadArticles value, $Res Function(LoadArticles) then) =
      _$LoadArticlesCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadArticlesCopyWithImpl<$Res>
    extends _$ArticleListEventCopyWithImpl<$Res>
    implements $LoadArticlesCopyWith<$Res> {
  _$LoadArticlesCopyWithImpl(
      LoadArticles _value, $Res Function(LoadArticles) _then)
      : super(_value, (v) => _then(v as LoadArticles));

  @override
  LoadArticles get _value => super._value as LoadArticles;
}

/// @nodoc

class _$LoadArticles implements LoadArticles {
  const _$LoadArticles();

  @override
  String toString() {
    return 'ArticleListEvent.loadArticles()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadArticles);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadArticles,
    required TResult Function(Article article) markAsFavorite,
    required TResult Function(Article article) unMarkAsFavorite,
  }) {
    return loadArticles();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadArticles,
    TResult Function(Article article)? markAsFavorite,
    TResult Function(Article article)? unMarkAsFavorite,
  }) {
    return loadArticles?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadArticles,
    TResult Function(Article article)? markAsFavorite,
    TResult Function(Article article)? unMarkAsFavorite,
    required TResult orElse(),
  }) {
    if (loadArticles != null) {
      return loadArticles();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadArticles value) loadArticles,
    required TResult Function(MarkAsFavorite value) markAsFavorite,
    required TResult Function(UnMarkAsFavorite value) unMarkAsFavorite,
  }) {
    return loadArticles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    TResult Function(MarkAsFavorite value)? markAsFavorite,
    TResult Function(UnMarkAsFavorite value)? unMarkAsFavorite,
  }) {
    return loadArticles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    TResult Function(MarkAsFavorite value)? markAsFavorite,
    TResult Function(UnMarkAsFavorite value)? unMarkAsFavorite,
    required TResult orElse(),
  }) {
    if (loadArticles != null) {
      return loadArticles(this);
    }
    return orElse();
  }
}

abstract class LoadArticles implements ArticleListEvent {
  const factory LoadArticles() = _$LoadArticles;
}

/// @nodoc
abstract class $MarkAsFavoriteCopyWith<$Res> {
  factory $MarkAsFavoriteCopyWith(
          MarkAsFavorite value, $Res Function(MarkAsFavorite) then) =
      _$MarkAsFavoriteCopyWithImpl<$Res>;
  $Res call({Article article});
}

/// @nodoc
class _$MarkAsFavoriteCopyWithImpl<$Res>
    extends _$ArticleListEventCopyWithImpl<$Res>
    implements $MarkAsFavoriteCopyWith<$Res> {
  _$MarkAsFavoriteCopyWithImpl(
      MarkAsFavorite _value, $Res Function(MarkAsFavorite) _then)
      : super(_value, (v) => _then(v as MarkAsFavorite));

  @override
  MarkAsFavorite get _value => super._value as MarkAsFavorite;

  @override
  $Res call({
    Object? article = freezed,
  }) {
    return _then(MarkAsFavorite(
      article == freezed
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
    ));
  }
}

/// @nodoc

class _$MarkAsFavorite implements MarkAsFavorite {
  const _$MarkAsFavorite(this.article);

  @override
  final Article article;

  @override
  String toString() {
    return 'ArticleListEvent.markAsFavorite(article: $article)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkAsFavorite &&
            (identical(other.article, article) || other.article == article));
  }

  @override
  int get hashCode => Object.hash(runtimeType, article);

  @JsonKey(ignore: true)
  @override
  $MarkAsFavoriteCopyWith<MarkAsFavorite> get copyWith =>
      _$MarkAsFavoriteCopyWithImpl<MarkAsFavorite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadArticles,
    required TResult Function(Article article) markAsFavorite,
    required TResult Function(Article article) unMarkAsFavorite,
  }) {
    return markAsFavorite(article);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadArticles,
    TResult Function(Article article)? markAsFavorite,
    TResult Function(Article article)? unMarkAsFavorite,
  }) {
    return markAsFavorite?.call(article);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadArticles,
    TResult Function(Article article)? markAsFavorite,
    TResult Function(Article article)? unMarkAsFavorite,
    required TResult orElse(),
  }) {
    if (markAsFavorite != null) {
      return markAsFavorite(article);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadArticles value) loadArticles,
    required TResult Function(MarkAsFavorite value) markAsFavorite,
    required TResult Function(UnMarkAsFavorite value) unMarkAsFavorite,
  }) {
    return markAsFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    TResult Function(MarkAsFavorite value)? markAsFavorite,
    TResult Function(UnMarkAsFavorite value)? unMarkAsFavorite,
  }) {
    return markAsFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    TResult Function(MarkAsFavorite value)? markAsFavorite,
    TResult Function(UnMarkAsFavorite value)? unMarkAsFavorite,
    required TResult orElse(),
  }) {
    if (markAsFavorite != null) {
      return markAsFavorite(this);
    }
    return orElse();
  }
}

abstract class MarkAsFavorite implements ArticleListEvent {
  const factory MarkAsFavorite(Article article) = _$MarkAsFavorite;

  Article get article;
  @JsonKey(ignore: true)
  $MarkAsFavoriteCopyWith<MarkAsFavorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnMarkAsFavoriteCopyWith<$Res> {
  factory $UnMarkAsFavoriteCopyWith(
          UnMarkAsFavorite value, $Res Function(UnMarkAsFavorite) then) =
      _$UnMarkAsFavoriteCopyWithImpl<$Res>;
  $Res call({Article article});
}

/// @nodoc
class _$UnMarkAsFavoriteCopyWithImpl<$Res>
    extends _$ArticleListEventCopyWithImpl<$Res>
    implements $UnMarkAsFavoriteCopyWith<$Res> {
  _$UnMarkAsFavoriteCopyWithImpl(
      UnMarkAsFavorite _value, $Res Function(UnMarkAsFavorite) _then)
      : super(_value, (v) => _then(v as UnMarkAsFavorite));

  @override
  UnMarkAsFavorite get _value => super._value as UnMarkAsFavorite;

  @override
  $Res call({
    Object? article = freezed,
  }) {
    return _then(UnMarkAsFavorite(
      article == freezed
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
    ));
  }
}

/// @nodoc

class _$UnMarkAsFavorite implements UnMarkAsFavorite {
  const _$UnMarkAsFavorite(this.article);

  @override
  final Article article;

  @override
  String toString() {
    return 'ArticleListEvent.unMarkAsFavorite(article: $article)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnMarkAsFavorite &&
            (identical(other.article, article) || other.article == article));
  }

  @override
  int get hashCode => Object.hash(runtimeType, article);

  @JsonKey(ignore: true)
  @override
  $UnMarkAsFavoriteCopyWith<UnMarkAsFavorite> get copyWith =>
      _$UnMarkAsFavoriteCopyWithImpl<UnMarkAsFavorite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadArticles,
    required TResult Function(Article article) markAsFavorite,
    required TResult Function(Article article) unMarkAsFavorite,
  }) {
    return unMarkAsFavorite(article);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadArticles,
    TResult Function(Article article)? markAsFavorite,
    TResult Function(Article article)? unMarkAsFavorite,
  }) {
    return unMarkAsFavorite?.call(article);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadArticles,
    TResult Function(Article article)? markAsFavorite,
    TResult Function(Article article)? unMarkAsFavorite,
    required TResult orElse(),
  }) {
    if (unMarkAsFavorite != null) {
      return unMarkAsFavorite(article);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadArticles value) loadArticles,
    required TResult Function(MarkAsFavorite value) markAsFavorite,
    required TResult Function(UnMarkAsFavorite value) unMarkAsFavorite,
  }) {
    return unMarkAsFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    TResult Function(MarkAsFavorite value)? markAsFavorite,
    TResult Function(UnMarkAsFavorite value)? unMarkAsFavorite,
  }) {
    return unMarkAsFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadArticles value)? loadArticles,
    TResult Function(MarkAsFavorite value)? markAsFavorite,
    TResult Function(UnMarkAsFavorite value)? unMarkAsFavorite,
    required TResult orElse(),
  }) {
    if (unMarkAsFavorite != null) {
      return unMarkAsFavorite(this);
    }
    return orElse();
  }
}

abstract class UnMarkAsFavorite implements ArticleListEvent {
  const factory UnMarkAsFavorite(Article article) = _$UnMarkAsFavorite;

  Article get article;
  @JsonKey(ignore: true)
  $UnMarkAsFavoriteCopyWith<UnMarkAsFavorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ArticleListStateTearOff {
  const _$ArticleListStateTearOff();

  _ArticleListState call(
      {bool isLoading = false, required Option<List<Article>> articles}) {
    return _ArticleListState(
      isLoading: isLoading,
      articles: articles,
    );
  }
}

/// @nodoc
const $ArticleListState = _$ArticleListStateTearOff();

/// @nodoc
mixin _$ArticleListState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<List<Article>> get articles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleListStateCopyWith<ArticleListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleListStateCopyWith<$Res> {
  factory $ArticleListStateCopyWith(
          ArticleListState value, $Res Function(ArticleListState) then) =
      _$ArticleListStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, Option<List<Article>> articles});
}

/// @nodoc
class _$ArticleListStateCopyWithImpl<$Res>
    implements $ArticleListStateCopyWith<$Res> {
  _$ArticleListStateCopyWithImpl(this._value, this._then);

  final ArticleListState _value;
  // ignore: unused_field
  final $Res Function(ArticleListState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as Option<List<Article>>,
    ));
  }
}

/// @nodoc
abstract class _$ArticleListStateCopyWith<$Res>
    implements $ArticleListStateCopyWith<$Res> {
  factory _$ArticleListStateCopyWith(
          _ArticleListState value, $Res Function(_ArticleListState) then) =
      __$ArticleListStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, Option<List<Article>> articles});
}

/// @nodoc
class __$ArticleListStateCopyWithImpl<$Res>
    extends _$ArticleListStateCopyWithImpl<$Res>
    implements _$ArticleListStateCopyWith<$Res> {
  __$ArticleListStateCopyWithImpl(
      _ArticleListState _value, $Res Function(_ArticleListState) _then)
      : super(_value, (v) => _then(v as _ArticleListState));

  @override
  _ArticleListState get _value => super._value as _ArticleListState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? articles = freezed,
  }) {
    return _then(_ArticleListState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as Option<List<Article>>,
    ));
  }
}

/// @nodoc

class _$_ArticleListState implements _ArticleListState {
  const _$_ArticleListState({this.isLoading = false, required this.articles});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final Option<List<Article>> articles;

  @override
  String toString() {
    return 'ArticleListState(isLoading: $isLoading, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArticleListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.articles, articles) ||
                other.articles == articles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, articles);

  @JsonKey(ignore: true)
  @override
  _$ArticleListStateCopyWith<_ArticleListState> get copyWith =>
      __$ArticleListStateCopyWithImpl<_ArticleListState>(this, _$identity);
}

abstract class _ArticleListState implements ArticleListState {
  const factory _ArticleListState(
      {bool isLoading,
      required Option<List<Article>> articles}) = _$_ArticleListState;

  @override
  bool get isLoading;
  @override
  Option<List<Article>> get articles;
  @override
  @JsonKey(ignore: true)
  _$ArticleListStateCopyWith<_ArticleListState> get copyWith =>
      throw _privateConstructorUsedError;
}
