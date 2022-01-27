import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';


class ClassVisitor extends SimpleElementVisitor<void> {
  /// visit to capture class name and its properties
  late String className;
  final fields = <String, dynamic>{};
  final methods = <String, dynamic>{};

  @override
  void visitConstructorElement(ConstructorElement element) {
    final elementReturnType = element.type.returnType.toString();

    className = elementReturnType.replaceFirst('*', '');

    super.visitConstructorElement(element);
  }

  @override
  void visitFieldElement(FieldElement element) {
    final elementType = element.type.toString();

    fields[element.name] = elementType.replaceFirst('*', '');

    super.visitFieldElement(element);
  }

  @override
  void visitFunctionElement(FunctionElement element) {
    final elementType = element.type.toString();

    methods[element.name] = elementType.replaceFirst('*', '');

    super.visitFunctionElement(element);
  }

}
