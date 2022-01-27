// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CollectionResponseGenerator
// **************************************************************************

extension GeneratedUserCollectionResponseExension on CollectionResponse<User> {
  List<User> get value =>
      <User>[...data.map((e) => _$UserFromJson(e)).toList()];
}

// **************************************************************************
// DataResponseGenerator
// **************************************************************************

extension GeneratedUserDataResponseExension on DataResponse<User> {
  User? get value => data == null ? null : _$UserFromJson(data!);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      age: json['age'] as int?,
      pass: json['pass'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'pass': instance.pass,
    };

// **************************************************************************
// PaginationResponseGenerator
// **************************************************************************

extension GeneratedUserPaginationResponseExension on PaginationResponse<User> {
  List<User> get value =>
      <User>[...data.map((e) => _$UserFromJson(e)).toList()];
}