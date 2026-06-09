import 'dart:io';
import 'package:yaml/yaml.dart';

class PubspecReader {
  List<String> getDependencies() {
    final file = File('pubspec.yaml');

    if (!file.existsSync()) {
      return [];
    }

    final content = file.readAsStringSync();
    final yaml = loadYaml(content);

    final dependencies = yaml['dependencies'];

    return dependencies.keys.cast<String>().toList();
  }
}