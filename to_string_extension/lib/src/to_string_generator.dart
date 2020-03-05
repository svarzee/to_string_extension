import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:class_extensions/class_extensions.dart';
import 'package:source_gen/source_gen.dart';
import 'package:to_string_extension_annotations/annotations.dart';

class ToStringGenerator extends ClassExtensionGenerator<ToString> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    ClassElement clazz = element;
    final out = StringBuffer();
    out.writeln('String toString() => ${generateString(clazz)};');
    return out.toString();
  }

  String generateString(ClassElement clazz) {
    final ctrParamNames = clazz.unnamedConstructor.parameters.map((e) => e.name).toSet();
    final out = StringBuffer();
    out.write("'${clazz.name}(' + ");
    out.write(clazz.fields
        .where((field) => ctrParamNames.contains(field.name))
        .map((field) => '${generateFieldString(clazz, field)} + ')
        .join("', ' + "));
    out.write("')'");
    return out.toString();
  }

  String generateFieldString(ClassElement clazz, FieldElement field) {
    return "'${field.name}=\${(this as ${clazz.name}).${field.name}.toString()}'";
  }
}
