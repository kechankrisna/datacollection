import 'package:build/build.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:datacollection/datacollection.dart';
import 'package:source_gen/source_gen.dart';
import 'pagination_response_generator.dart';
import 'collection_response_generator.dart';
import 'data_response_generator.dart';

import 'class_visitor.dart';

class DataCollectionGenerator
    extends GeneratorForAnnotation<DataCollectionAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ClassVisitor();
    element.visitChildren(visitor);

    final classBuffer = StringBuffer();
    final className = visitor.className;

    bool enablePaginations = annotation.peek("paginations")?.boolValue ?? false;
    bool enableCollections = annotation.peek("collections")?.boolValue ?? false;
    bool enableResponse = annotation.peek("response")?.boolValue ?? false;

    if (enablePaginations) {
      final _paginationBuffer =
          PaginationResponseGenerator.generateStringBuffer(className);

      classBuffer.write(_paginationBuffer);
    }

    if (enableCollections) {
      final _collectionBuff =
          CollectionResponseGenerator.generateStringBuffer(className);
      classBuffer.write(_collectionBuff);
    }

    if (enableResponse) {
      final _responseBuff =
          DataResponseGenerator.generateStringBuffer(className);

      classBuffer.write(_responseBuff);
    }

    return classBuffer.toString();
  }

  const DataCollectionGenerator([BuilderOptions? options]);
}
