import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:datacollection/datacollection.dart';
import 'package:retrofit/retrofit.dart';

part 'post.g.dart';

@RestApi(baseUrl: 'https://mylekha.app/api/v1/app/')
abstract class ClientPost {
  factory ClientPost(Dio dio, {String baseUrl}) = _ClientPost;

  @GET("/posts")
  Future<PaginationResponse<Post>> getPosts();

  @GET("/posts/{id}")
  Future<HttpResponse<Post>> getPost(@Path("id") int id);
}

@JsonSerializable()
@paginations
@collections
@response
@computed
class Post {
  @JsonKey(defaultValue: null)
  final int? id;

  @JsonKey(defaultValue: "")
  final String? slug;

  @JsonKey(defaultValue: "")
  final String? title;

  @JsonKey(defaultValue: "")
  final String? content; // post content

  @JsonKey(defaultValue: "post")
  final String? type; // post type

  @JsonKey(defaultValue: null)
  final String? link; // post link for video or audio

  @JsonKey(defaultValue: <String>[])
  final List<String>? images;

  @JsonKey(defaultValue: "en_US")
  final String? locale;

  Post({
    this.id,
    this.slug,
    this.title,
    this.content,
    this.type,
    this.link,
    this.images,
    this.locale,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromMap(Map<String, dynamic> map) => _$PostFromJson(map);

  Map<String, dynamic> toMap() => _$PostToJson(this);

  Post copyWith({
    int? id,
    String? slug,
    String? title,
    String? content,
    String? type,
    String? link,
    List<String>? images,
    String? locale,
  }) {
    return Post(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      link: link ?? this.link,
      images: images ?? this.images,
      locale: locale ?? this.locale,
    );
  }

  @override
  String toString() {
    return 'Post(id: $id, slug: $slug, title: $title, content: $content, type: $type, link: $link, images: $images, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Post &&
        other.id == id &&
        other.slug == slug &&
        other.title == title &&
        other.content == content &&
        other.type == type &&
        other.link == link &&
        listEquals(other.images, images) &&
        other.locale == locale;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        slug.hashCode ^
        title.hashCode ^
        content.hashCode ^
        type.hashCode ^
        link.hashCode ^
        images.hashCode ^
        locale.hashCode;
  }
}
