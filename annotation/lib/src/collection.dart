import 'package:meta/meta.dart';
export 'models/pagination_response.dart';

@immutable
class PaginationResponseAnnotation {
  const PaginationResponseAnnotation();
}

@immutable
class CollectionResponseAnnotation {
  const CollectionResponseAnnotation();
}

@immutable
class DataResponseAnnotation {
  const DataResponseAnnotation();
}

const paginations = PaginationResponseAnnotation();

const collections = CollectionResponseAnnotation();

const resource = DataResponseAnnotation();
