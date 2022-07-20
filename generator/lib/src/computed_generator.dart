import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import 'package:datacollection/datacollection.dart';

import 'class_visitor.dart';

class ComputedGenerator
    extends GeneratorForAnnotation<ComputedAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ClassVisitor();
    element.visitChildren(visitor);
    final className = visitor.className;

    final classBuffer = generateStringBuffer(className);

    return classBuffer.toString();
  }

  /// ### `generateStringBuffer`
  ///
  /// allow to generate the boilerplate for data reponse
  static StringBuffer generateStringBuffer(String className) {
    final classBuffer = StringBuffer();

    /// EX: User deserializeUser(Map<String, dynamic> json) => User.fromJson(json);
    classBuffer.writeln(
        '${className} deserialize${className}(Map<String, dynamic> json) => ${className}.fromJson(json);');

    /// Ex: List<User> deserializeUserList(List<Map<String, dynamic>> json) => json.map((e) => User.fromJson(e)).toList();
    classBuffer.writeln(
        'List<${className}> deserialize${className}List(List<Map<String, dynamic>> json) => json.map((e) => ${className}.fromJson(e)).toList();');

    /// Ex: Map<String, dynamic> serializeUser(User object) => object.toJson();
    classBuffer.writeln(
        'Map<String, dynamic> serialize${className}(${className} object) => object.toJson();');

    /// Ex: List<Map<String, dynamic>> serializeUserList(List<User> objects) => objects.map((e) => e.toJson()).toList();
    classBuffer.writeln(
        'List<Map<String, dynamic>> serialize${className}List(List<${className}> objects) => objects.map((e) => e.toJson()).toList();');

    return classBuffer;
  }
}
