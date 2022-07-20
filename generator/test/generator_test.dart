import 'dart:async';
import 'package:build/build.dart';
import 'package:datacollection_generator/src/data_collection_generator.dart';
import 'package:source_gen_test/src/build_log_tracking.dart';
import 'package:source_gen_test/src/init_library_reader.dart';
import 'package:source_gen_test/src/test_annotated_classes.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
      'test/src', 'generator_test_src.dart');
  initializeBuildLogTracking();
  var options = BuilderOptions({
    'paginations': true,
    'collections': true,
    'response': true,
    'computed': true,
  });
  testAnnotatedElements(reader, DataCollectionGenerator(options));
}
