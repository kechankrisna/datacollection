import 'package:json_annotation/json_annotation.dart';

import 'package:datacollection/datacollection.dart';

part 'user.g.dart';

@JsonSerializable()
@paginations
class User {
  final String? name;
  final int? age;
  final bool? pass;

  User({this.name, this.age, this.pass});

  factory User.fromJson(Map<String, dynamic> json) => User();

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "pass": pass,
    };
  }
}