import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/to_string_generator.dart';

Builder toStringBuilder(BuilderOptions options) =>
    SharedPartBuilder([ToStringGenerator()], '2_to_string',
        formatOutput: (code) => code);
