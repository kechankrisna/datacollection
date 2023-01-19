import 'dart:convert';

import 'package:collection/collection.dart';

class PaginationResponse<T> {
  SortPaginationResponse? sort;

  int? currentPage;

  List<Map<String, dynamic>> data;

  String? firstPageUrl;

  int? from;

  int? lastPage;

  String? lastPageUrl;

  String? nextPageUrl;

  String? path;

  int? perPage;

  String? prevPageUrl;

  int? to;

  int? total;
  PaginationResponse({
    this.sort,
    this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);

  factory PaginationResponse.fromMap(Map<String, dynamic> map) =>
      _$PaginationResponseFromJson(map);

  Map<String, dynamic> toMap() => _$PaginationResponseToJson(this);

  PaginationResponse<T> copyWith({
    SortPaginationResponse? sort,
    int? currentPage,
    List<Map<String, dynamic>>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) {
    return PaginationResponse<T>(
      sort: sort ?? this.sort,
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  @override
  String toString() {
    return 'PaginationResponse(sort: $sort, currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is PaginationResponse<T> &&
        other.sort == sort &&
        other.currentPage == currentPage &&
        listEquals(other.data, data) &&
        other.firstPageUrl == firstPageUrl &&
        other.from == from &&
        other.lastPage == lastPage &&
        other.lastPageUrl == lastPageUrl &&
        other.nextPageUrl == nextPageUrl &&
        other.path == path &&
        other.perPage == perPage &&
        other.prevPageUrl == prevPageUrl &&
        other.to == to &&
        other.total == total;
  }

  @override
  int get hashCode {
    return sort.hashCode ^
        currentPage.hashCode ^
        data.hashCode ^
        firstPageUrl.hashCode ^
        from.hashCode ^
        lastPage.hashCode ^
        lastPageUrl.hashCode ^
        nextPageUrl.hashCode ^
        path.hashCode ^
        perPage.hashCode ^
        prevPageUrl.hashCode ^
        to.hashCode ^
        total.hashCode;
  }
}

PaginationResponse<T> _$PaginationResponseFromJson<T>(
        Map<String, dynamic> json) =>
    PaginationResponse<T>(
      sort: (json['sort'] as Map?) == null
          ? null
          : SortPaginationResponse.fromJson((json['sort'])),
      currentPage: int.tryParse(json['current_page'].toString()) ?? 1,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      firstPageUrl: json['first_page_url'] as String?,
      from: int.tryParse(json['from'].toString()) ?? 1,
      lastPage: int.tryParse(json['last_page'].toString()) ?? 1,
      lastPageUrl: json['last_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: int.tryParse(json['per_page'].toString()) ?? 1,
      prevPageUrl: json['prev_page_url'] as String?,
      to: int.tryParse(json['to'].toString()) ?? 1,
      total: int.tryParse(json['total'].toString()) ?? 0,
    );

Map<String, dynamic> _$PaginationResponseToJson<T>(
        PaginationResponse<T> instance) =>
    <String, dynamic>{
      'sort': instance.sort,
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

/// default extension will return values as list of map
extension PaginationResponseExention on PaginationResponse {
  List<Map<String, dynamic>> get value => <Map<String, dynamic>>[...data];
}

class SortPaginationResponse {
  List<String> keys;
  String? orderBy;
  String? orderType;

  SortPaginationResponse({
    required this.keys,
    this.orderBy,
    this.orderType,
  });

  SortPaginationResponse copyWith({
    List<String>? keys,
    String? orderBy,
    String? orderType,
  }) {
    return SortPaginationResponse(
      keys: keys ?? this.keys,
      orderBy: orderBy ?? this.orderBy,
      orderType: orderType ?? this.orderType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'keys': keys,
      'order_by': orderBy,
      'order_type': orderType,
    };
  }

  factory SortPaginationResponse.fromMap(Map<String, dynamic> map) {
    return SortPaginationResponse(
      keys: List<String>.from(map['keys']),
      orderBy: map['order_by'],
      orderType: map['order_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SortPaginationResponse.fromJson(String source) =>
      SortPaginationResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'SortPaginationResponse(keys: $keys, orderBy: $orderBy, orderType: $orderType)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is SortPaginationResponse &&
        listEquals(other.keys, keys) &&
        other.orderBy == orderBy &&
        other.orderType == orderType;
  }

  @override
  int get hashCode => keys.hashCode ^ orderBy.hashCode ^ orderType.hashCode;
}
