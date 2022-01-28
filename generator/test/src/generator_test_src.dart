import 'package:datacollection/datacollection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:source_gen_test/annotations.dart';

@ShouldGenerate(r'''
extension GeneratedPostCollectionResponseExension on CollectionResponse<Post> {
  List<Post> get value =>
      <Post>[...data.map((e) => _$PostFromJson(e)).toList()];
}
''', contains: true)
@ShouldGenerate(r'''
extension GeneratedPostPaginationResponseExension on PaginationResponse<Post> {
  List<Post> get value =>
      <Post>[...data.map((e) => _$PostFromJson(e)).toList()];
}
''', contains: true)
@ShouldGenerate(r'''
extension GeneratedPostDataResponseExension on DataResponse<Post> {
  Post? get value => data == null ? null : _$PostFromJson(data!);
}
''', contains: true)
@JsonSerializable()
@datacollections
class Post {}

@ShouldGenerate(r'''
extension GeneratedStudentDataResponseExension on DataResponse<Student> {
  Student? get value => data == null ? null : _$StudentFromJson(data!);
}
''', contains: true)
@JsonSerializable()
@DataCollectionAnnotation(
  paginations: true,
  collections:true,
  response: true,
)
class Student {}
