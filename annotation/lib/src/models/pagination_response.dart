import 'package:collection/collection.dart';

class PaginationResponse<T> {
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
      _$PaginateCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$PaginateCollectionToJson(this);

  factory PaginationResponse.fromMap(Map<String, dynamic> map) =>
      _$PaginateCollectionFromJson(map);

  Map<String, dynamic> toMap() => _$PaginateCollectionToJson(this);

  PaginationResponse<T> copyWith({
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
    return 'PaginateCollection(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is PaginationResponse<T> &&
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
    return currentPage.hashCode ^
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

PaginationResponse<T> _$PaginateCollectionFromJson<T>(
        Map<String, dynamic> json) =>
    PaginationResponse<T>(
      currentPage: json['current_page'] as int? ?? 1,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int? ?? 1,
      lastPage: json['last_page'] as int? ?? 1,
      lastPageUrl: json['last_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int? ?? 1,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as int? ?? 1,
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$PaginateCollectionToJson<T>(
        PaginationResponse<T> instance) =>
    <String, dynamic>{
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
extension PaginateCollectionExention on PaginationResponse {
  List<Map<String, dynamic>> get value => <Map<String, dynamic>>[...data];
}
