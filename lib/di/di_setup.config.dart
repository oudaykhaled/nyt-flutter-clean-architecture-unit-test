// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../articles_list/data/remote/service/article_service.dart' as _i4;
import '../articles_list/data/remote/source/article_remote_data_source.dart'
    as _i5;
import '../articles_list/data/remote/source/article_remote_data_source_impl.dart'
    as _i6;
import '../articles_list/data/repository/article_repo_impl.dart' as _i8;
import '../articles_list/domain/repository/article_repo.dart' as _i7;
import '../articles_list/domain/usecase/article_usecase.dart' as _i9;
import '../articles_list/domain/usecase/article_usecase_impl.dart' as _i10;
import '../articles_list/presentation/bloc/article_list_bloc.dart' as _i11;
import 'app_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.Dio>(appModule.dio);
  gh.factory<_i4.ArticleService>(() => _i4.ArticleService(get<_i3.Dio>()));
  gh.factory<_i5.ArticleRemoteDataSource>(
      () => _i6.ArticleRemoteDataSourceImpl(get<_i4.ArticleService>()));
  gh.factory<_i7.ArticleRepo>(
      () => _i8.ArticleRepoImpl(get<_i5.ArticleRemoteDataSource>()));
  gh.factory<_i9.ArticleUseCase>(
      () => _i10.ArticleUseCaseImpl(get<_i7.ArticleRepo>()));
  gh.factory<_i11.ArticleListBloc>(
      () => _i11.ArticleListBloc(get<_i9.ArticleUseCase>()));
  return get;
}

class _$AppModule extends _i12.AppModule {}
