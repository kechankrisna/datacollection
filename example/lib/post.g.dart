// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// CollectionResponseGenerator
// **************************************************************************

extension GeneratedPostCollectionResponseExtension on CollectionResponse<Post> {
  List<Post> get value =>
      <Post>[...data.map((e) => _$PostFromJson(e)).toList()];
}

// **************************************************************************
// DataResponseGenerator
// **************************************************************************

extension GeneratedPostDataResponseExtension on DataResponse<Post> {
  Post? get value => data == null ? null : _$PostFromJson(data!);
}

extension GeneratedPostHttpResponseExtension on HttpResponse<Post> {
  Post? get value => (this.response.data != null &&
          (this.response.data is Map<String, dynamic>) &&
          [200].contains(this.response.statusCode))
      ? Post.fromJson((this.response.data! as Map<String, dynamic>)["data"])
      : null;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int?,
      slug: json['slug'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      type: json['type'] as String? ?? 'post',
      link: json['link'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      locale: json['locale'] as String? ?? 'en_US',
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'link': instance.link,
      'images': instance.images,
      'locale': instance.locale,
    };

// **************************************************************************
// PaginationResponseGenerator
// **************************************************************************

extension GeneratedPostPaginationResponseExtension on PaginationResponse<Post> {
  List<Post> get value =>
      <Post>[...data.map((e) => _$PostFromJson(e)).toList()];
}

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ClientPost implements ClientPost {
  _ClientPost(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://mylekha.app/api/v1/app/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PaginationResponse<Post>> getPosts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PaginationResponse<Post>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/posts',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PaginationResponse<Post>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HttpResponse<Post>> getPost(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<Post>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/posts/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Post.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
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
