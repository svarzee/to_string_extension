import 'package:meta/meta.dart';
import 'package:to_string_extension_annotations/annotations.dart';

part 'model.g.dart';

@ToString()
@immutable
class SomeValueClass with _$SomeValueClass {
  final String strVal;
  final int intVal;

  SomeValueClass(this.strVal, this.intVal);
}
