import 'package:datacollection/datacollection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:source_gen_test/annotations.dart';

@ShouldGenerate(r'''
extension GeneratedPostCollectionResponseExtension on CollectionResponse<Post> {
  List<Post> get value =>
      <Post>[...data.map((e) => _$PostFromJson(e)).toList()];
}
''', contains: true)
@ShouldGenerate(r'''
extension GeneratedPostPaginationResponseExtension on PaginationResponse<Post> {
  List<Post> get value =>
      <Post>[...data.map((e) => _$PostFromJson(e)).toList()];
}
''', contains: true)
@ShouldGenerate(r'''
extension GeneratedPostDataResponseExtension on DataResponse<Post> {
  Post? get value => data == null ? null : _$PostFromJson(data!);
}
''', contains: true)
@JsonSerializable()
@datacollections
class Post {}

@ShouldGenerate(r'''
extension GeneratedStudentDataResponseExtension on DataResponse<Student> {
  Student? get value => data == null ? null : _$StudentFromJson(data!);
}
''', contains: true)
@ShouldGenerate(r'''
Student deserializeStudent(Map<String, dynamic> json) => Student.fromJson(json);
List<Student> deserializeStudentList(List<Map<String, dynamic>> json) =>
    json.map((e) => Student.fromJson(e)).toList();
Map<String, dynamic> serializeStudent(Student object) => object.toJson();
List<Map<String, dynamic>> serializeStudentList(List<Student> objects) =>
    objects.map((e) => e.toJson()).toList();
''', contains: true)
@JsonSerializable()
@DataCollectionAnnotation(
  paginations: true,
  collections: true,
  response: true,
  computed: true,
)
class Student {}
