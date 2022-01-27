// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// CollectionResponseGenerator
// **************************************************************************

extension GeneratedPostCollectionResponseExension on CollectionResponse<Post> {
  List<Post> get value =>
      <Post>[...data.map((e) => _$PostFromJson(e)).toList()];
}

// **************************************************************************
// DataResponseGenerator
// **************************************************************************

extension GeneratedPostDataResponseExension on DataResponse<Post> {
  Post? get value => data == null ? null : _$PostFromJson(data!);
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

extension GeneratedPostPaginationResponseExension on PaginationResponse<Post> {
  List<Post> get value =>
      <Post>[...data.map((e) => _$PostFromJson(e)).toList()];
}
