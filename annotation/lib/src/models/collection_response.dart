import 'package:collection/collection.dart';

class CollectionResponse<T> {
  List<Map<String, dynamic>> data;

  int get total => data.length;

  CollectionResponse({
    required this.data,
  });

  factory CollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$DataCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$DataCollectionToJson(this);

  factory CollectionResponse.fromMap(Map<String, dynamic> map) =>
      _$DataCollectionFromJson(map);

  Map<String, dynamic> toMap() => _$DataCollectionToJson(this);

  CollectionResponse<T> copyWith({List<Map<String, dynamic>>? data}) {
    return CollectionResponse<T>(
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return 'DataCollection(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is CollectionResponse<T> &&
        listEquals(other.data, data) &&
        other.total == total;
  }

  @override
  int get hashCode {
    return data.hashCode ^ total.hashCode;
  }
}

CollectionResponse<T> _$DataCollectionFromJson<T>(Map<String, dynamic> json) =>
    CollectionResponse<T>(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
    );

Map<String, dynamic> _$DataCollectionToJson<T>(
        CollectionResponse<T> instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

/// default extension will return values as list of map
extension DataCollectionExtension on CollectionResponse {
  List<Map<String, dynamic>> get value => <Map<String, dynamic>>[...data];
}
