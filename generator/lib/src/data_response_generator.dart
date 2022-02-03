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
    final className = visitor.className;
    final classBuffer = StringBuffer();

    classBuffer.write(generateStringBuffer(className));

    return classBuffer.toString();
  }

  /// ### `generateStringBuffer`
  ///
  /// allow to generate the boilerplate for data reponse
  static StringBuffer generateStringBuffer(
    String className, {
    bool useKey = true,
    List<int> statusCodes = const [200],
  }) {
    final classBuffer = StringBuffer();

    /// EX: extension GeneratedUserDataResponse on DataResponse<User> {
    classBuffer.writeln(
        'extension Generated${className}DataResponseExtension on DataResponse<${className}> {');

    /// EX : User get value => _$UserFromJson(data);

    classBuffer.writeln(
        '${className}? get value => data == null ? null : _\$${className}FromJson(data!);');

    classBuffer.writeln('}');

    if (useKey) {
      /// generate Extension on HttpResponse<User>
      classBuffer.writeln(
          'extension Generated${className}HttpResponseExtension on HttpResponse<${className}> {');

      /// EX : User? get data =>
      /// (this.response.data != null && [200].contains(this.response.statusCode))
      ///     ? User.fromJson((this.response.data! is Map<String, dynamic>)
      ///         ? (this.response.data! as Map<String, dynamic>)["data"]
      ///         : json.decode(this.response.data.toString()))
      ///     : null;
      var _statusCodes = List<int>.from(statusCodes);
      if (_statusCodes.isEmpty) {
        _statusCodes = [200];
      }
      classBuffer.writeln(
          '''${className}? get value => (this.response.data != null && (this.response.data is Map<String, dynamic>) && ${_statusCodes}.contains(this.response.statusCode))
          ? ${className}.fromJson((this.response.data! as Map<String, dynamic>)["data"])
          : null;''');

      classBuffer.writeln('}');
    }

    return classBuffer;
  }
}
