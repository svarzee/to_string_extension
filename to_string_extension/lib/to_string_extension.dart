import 'package:build/build.dart';
import 'package:class_extensions/class_extensions.dart';

import 'src/to_string_generator.dart';

Builder toStringDummyBuilder(BuilderOptions options) =>
    registerClassExtensionGenerator(2, ToStringGenerator());
