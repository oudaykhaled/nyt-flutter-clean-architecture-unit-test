// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ArticleService implements ArticleService {
  _ArticleService(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MostPopularResponse> getTasks(apiKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api-key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MostPopularResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'mostpopular/v2/emailed/30.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MostPopularResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
