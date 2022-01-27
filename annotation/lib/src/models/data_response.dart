import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart' show Response;

class DataResponse<T> {
  int statusCode;

  bool get status => (statusCode == 200);

  String? statusMessage;

  String? message;

  Map<String, dynamic>? errors;

  Map<String, dynamic>? data;

  DataResponse({
    required this.statusCode,
    this.statusMessage,
    this.message,
    this.errors,
    this.data,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  factory DataResponse.fromReponse(Response response) =>
      _$DataResponseFromResponse<T>(response);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);

  factory DataResponse.fromMap(Map<String, dynamic> map) =>
      _$DataResponseFromJson(map);

  Map<String, dynamic> toMap() => _$DataResponseToJson(this);

  @override
  String toString() {
    return 'DataResponse(statusCode: $statusCode, statusMessage: $statusMessage, message: $message, errors: $errors, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is DataResponse<T> &&
        other.statusCode == statusCode &&
        other.statusMessage == statusMessage &&
        other.message == message &&
        mapEquals(other.errors, errors) &&
        mapEquals(other.data, data);
  }

  @override
  int get hashCode {
    return statusCode.hashCode ^
        statusMessage.hashCode ^
        message.hashCode ^
        errors.hashCode ^
        data.hashCode;
  }

  DataResponse<T> copyWith({
    int? statusCode,
    String? statusMessage,
    String? message,
    Map<String, dynamic>? errors,
    Map<String, dynamic>? data,
  }) {
    return DataResponse<T>(
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      data: data ?? this.data,
    );
  }
}

DataResponse<T> _$DataResponseFromJson<T>(Map<String, dynamic> json) =>
    DataResponse<T>(
      statusCode: json['status_code'] as int? ?? 500,
      statusMessage: json['status_message'] as String? ?? '',
      message: json['message'] as String? ?? '',
      errors: json['errors'] as Map<String, dynamic>?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DataResponseToJson<T>(DataResponse<T> instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'message': instance.message,
      'errors': instance.errors,
      'data': instance.data,
    };

DataResponse<T> _$DataResponseFromResponse<T>(Response response) =>
    DataResponse<T>(
      statusCode: response.statusCode ?? 500,
      statusMessage: response.statusMessage ?? '',
      data: (response.data != null && response.statusCode.inRange(200, 299))
          ? (response.data! is Map<String, dynamic>)
              ? (response.data! as Map<String, dynamic>)
              : json.decode(response.data.toString())
          : null,
      message: response.data != null
          ? (response.data! is Map<String, dynamic>)
              ? (response.data! as Map<String, dynamic>)['message']
                      as String? ??
                  (response.data! as Map<String, dynamic>)['message'].toString()
              : null
          : null,
      errors: (response.data != null)
          ? (response.data! is Map<String, dynamic>)
              ? response.data!['errors'] as Map<String, dynamic>?
              : null
          : null,
    );

/// default extension will return values as list of map
extension DataResponseExtension on DataResponse {
  Map<String, dynamic>? get value =>
      data == null ? null : Map<String, dynamic>.from(data!);
}

/// cast from Response to DataResponse
extension ResponseExt<T> on Response<T> {
  DataResponse<T> get toDataResponse => DataResponse<T>.fromJson({
        'status_code': this.statusCode,
        'status_message': this.statusMessage,
        'data': this.data,
        'message': (this.data is Map)
            ? (this.data as Map)["message"]
            : this.data.toString(),
        'errors': (this.data is Map)
            ? (this.data as Map)["errors"]
            : this.data.toString(),
      });
}

extension StatusCodeExt on int? {
  bool inRange(int min, int max) {
    if (this == null) return false;
    if (this! >= min && this! <= max) return true;
    return false;
  }
}
