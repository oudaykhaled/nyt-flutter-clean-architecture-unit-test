import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../common/constant.dart';

@module
abstract class AppModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: baseUrl));
}
