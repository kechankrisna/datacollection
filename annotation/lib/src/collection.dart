import 'package:meta/meta.dart';
export 'models/pagination_response.dart';
export 'models/collection_response.dart';
export 'models/data_response.dart';

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

@immutable
class ComputedAnnotation {
  const ComputedAnnotation();
}

@immutable
class DataCollectionAnnotation {
  /// to enable paginations generator
  final bool? paginations;

  /// to enable collections generator
  final bool? collections;

  /// to enable response generator
  final bool? response;

  /// to enable compute
  final bool? computed;

  /// constructor
  const DataCollectionAnnotation({
    this.paginations,
    this.collections,
    this.response,
    this.computed,
  });
}

const paginations = PaginationResponseAnnotation();

const collections = CollectionResponseAnnotation();

const response = DataResponseAnnotation();

const computed = ComputedAnnotation();

const datacollections = DataCollectionAnnotation(
    paginations: true, collections: true, response: true, computed: true);
