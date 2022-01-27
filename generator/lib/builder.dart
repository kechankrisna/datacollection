import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/paginate_collection_generator.dart';
import 'src/data_collection_generator.dart';
import 'src/data_resource_generator.dart';

Builder paginationExtension(BuilderOptions options) =>
    SharedPartBuilder([PaginationResponseGenerator()], 'paginate_response');

Builder collectionExtension(BuilderOptions options) =>
    SharedPartBuilder([CollectionResponseGenerator()], 'collection_response');

Builder dataExtension(BuilderOptions options) =>
    SharedPartBuilder([DataResponseGenerator()], 'data_response');
