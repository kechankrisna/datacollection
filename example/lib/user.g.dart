// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CollectionResponseGenerator
// **************************************************************************

extension GeneratedUserCollectionResponseExtension on CollectionResponse<User> {
  List<User> get value =>
      <User>[...data.map((e) => _$UserFromJson(e)).toList()];
}

// **************************************************************************
// DataResponseGenerator
// **************************************************************************

extension GeneratedUserDataResponseExtension on DataResponse<User> {
  User? get value => data == null ? null : _$UserFromJson(data!);
}

extension GeneratedUserHttpResponseExtension on HttpResponse<User> {
  User? get value => (this.response.data != null &&
          (this.response.data is Map<String, dynamic>) &&
          [200].contains(this.response.statusCode))
      ? User.fromJson((this.response.data! as Map<String, dynamic>)["data"])
      : null;
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

extension GeneratedUserPaginationResponseExtension on PaginationResponse<User> {
  List<User> get value =>
      <User>[...data.map((e) => _$UserFromJson(e)).toList()];
}
