import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import 'package:datacollection/datacollection.dart';

import 'class_visitor.dart';

class DataResponseGenerator
    extends GeneratorForAnnotation<DataResponseAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ClassVisitor();
    element.visitChildren(visitor);

    final classBuffer = StringBuffer();
    final className = visitor.className;

    /// EX: extension GeneratedUserDataResponse on DataResponse<User> {
    classBuffer.writeln(
        'extension Generated${className}DataResponseExension on DataResponse<${className}> {');

    /// EX : User get value => _$UserFromJson(data);

    classBuffer.writeln(
        '${className}? get value => data == null ? null : _\$${className}FromJson(data!);');

    classBuffer.writeln('}');

    return classBuffer.toString();
  }
}
