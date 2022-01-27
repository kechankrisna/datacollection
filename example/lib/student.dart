import 'package:datacollection/datacollection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
@paginations
@collections
@response
class Student {
  final String? name;
  final num? grade;
  final num? score;

  Student({
    this.name,
    this.grade,
    this.score,
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  factory Student.fromMap(Map<String, dynamic> map) => _$StudentFromJson(map);

  Map<String, dynamic> toMap() => _$StudentToJson(this);
}
