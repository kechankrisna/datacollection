import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/pagination_response_generator.dart';
import 'src/collection_response_generator.dart';
import 'src/data_response_generator.dart';
import 'src/data_collection_generator.dart';

Builder paginationExtension(BuilderOptions options) =>
    SharedPartBuilder([PaginationResponseGenerator()], 'paginate_response');

Builder collectionExtension(BuilderOptions options) =>
    SharedPartBuilder([CollectionResponseGenerator()], 'collection_response');

Builder dataExtension(BuilderOptions options) =>
    SharedPartBuilder([DataResponseGenerator()], 'data_response');

Builder dataCollectionExtension(BuilderOptions options) =>
    SharedPartBuilder([DataCollectionGenerator()], 'data_collection');
