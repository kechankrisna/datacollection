import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import 'package:datacollection/datacollection.dart';

import 'class_visitor.dart';

class CollectionResponseGenerator
    extends GeneratorForAnnotation<CollectionResponseAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ClassVisitor();
    element.visitChildren(visitor);

    final classBuffer = StringBuffer();
    final className = visitor.className;

    /// EX: extension GeneratedUserCollectionResponse on CollectionResponse<User> {
    classBuffer.writeln(
        'extension Generated${className}CollectionResponseExension on CollectionResponse<${className}> {');

    /// EX : List<User> get value => <User>[...data.map((e) => _$UserFromJson(e)).toList()];

    classBuffer.writeln(
        'List<${className}> get value => <${className}>[...data.map((e) => _\$${className}FromJson(e)).toList()] ;');

    classBuffer.writeln('}');

    return classBuffer.toString();
  }
}
