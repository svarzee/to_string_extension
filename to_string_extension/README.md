Description
---
Uses class_extensions to generate toString for nicely looking text representation of data objects.

See also [withers_extension](https://pub.dev/packages/withers_extension), [json_extension](https://pub.dev/packages/json_extension)

Tutorial
---
1. We need a class to generate toString for.

    ##### `${PROJECT_ROOT}/lib/model.dart`
    ```dart
    import 'package:meta/meta.dart';
    
    @immutable
    class SomeValueClass {
      final String strVal;
      final int intVal;

      SomeValueClass(this.strVal, this.intVal);
    }
    ```

2. For toString to work you need to add some boiler plate:
    * `part 'model.g.dart';`
    * annotation `@ToString()`
    * mixin `_$SomeValueClass`

    ##### `${PROJECT_ROOT}/lib/model.dart`
    ```dart
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
    ```

3. Configure code generation. More info at [build](https://github.com/dart-lang/build).

    ##### `${PROJECT_ROOT}/build.yaml`
    ```yaml
    targets:
      $default:
        builders:
          to_string_extension|to_string:
            generate_for:
            - lib/*.dart
    ```
4. Add dependencies.

    ##### `${PROJECT_ROOT}/pubspec.yaml`
    ```yaml
    name: example

    dependencies:
      class_extensions_annotations: ^0.1.0
      to_string_extension_annotations: ^0.1.0

    dev_dependencies:
      build_runner: ^1.0.0
      class_extensions: ^0.3.0
      to_string_extension: ^0.1.0
    ```

5. Run code generation: `pub run build_runner build`. File `${PROJECT_ROOT}/lib/model.g.dart` should be created.

6. If everything goes well you should be able to print a nice looking text representation of your object.

    ##### `${PROJECT_ROOT}/bin/main.dart`
    ```dart
    import 'package:example/model.dart';
    
    void main() {
      print(SomeValueClass("some", 0).toString()); // prints SomeValueClass(strVal=some, intVal=0)
    }
    ```

7. You can also see the [example](https://github.com/svarzee/to_string_extension/tree/master/to_string_extension/example).
