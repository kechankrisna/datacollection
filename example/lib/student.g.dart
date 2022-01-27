// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// CollectionResponseGenerator
// **************************************************************************

extension GeneratedStudentCollectionResponseExension
    on CollectionResponse<Student> {
  List<Student> get value =>
      <Student>[...data.map((e) => _$StudentFromJson(e)).toList()];
}

// **************************************************************************
// DataResponseGenerator
// **************************************************************************

extension GeneratedStudentDataResponseExension on DataResponse<Student> {
  Student? get value => data == null ? null : _$StudentFromJson(data!);
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

// **************************************************************************
// PaginationResponseGenerator
// **************************************************************************

extension GeneratedStudentPaginationResponseExension
    on PaginationResponse<Student> {
  List<Student> get value =>
      <Student>[...data.map((e) => _$StudentFromJson(e)).toList()];
}
