// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// DataCollectionGenerator
// **************************************************************************

extension GeneratedStudentPaginationResponseExtension
    on PaginationResponse<Student> {
  List<Student> get value =>
      <Student>[...data.map((e) => _$StudentFromJson(e)).toList()];
}

extension GeneratedStudentCollectionResponseExtension
    on CollectionResponse<Student> {
  List<Student> get value =>
      <Student>[...data.map((e) => _$StudentFromJson(e)).toList()];
}

extension GeneratedStudentDataResponseExtension on DataResponse<Student> {
  Student? get value => data == null ? null : _$StudentFromJson(data!);
}

extension GeneratedStudentHttpResponseExtension on HttpResponse<Student> {
  Student? get value => (this.response.data != null &&
          (this.response.data is Map<String, dynamic>) &&
          [200].contains(this.response.statusCode))
      ? Student.fromJson((this.response.data! as Map<String, dynamic>)["data"])
      : null;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      name: json['name'] as String?,
      grade: json['grade'] as num?,
      score: json['score'] as num?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'name': instance.name,
      'grade': instance.grade,
      'score': instance.score,
    };
