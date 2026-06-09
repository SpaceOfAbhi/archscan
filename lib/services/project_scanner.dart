import 'dart:io';

class ProjectScanner {
  bool isFlutterProject() {
    final pubspec = File('pubspec.yaml');

    if (!pubspec.existsSync()) {
      return false;
    }

    return true;
  }

  List<String> getDartFiles() {
    final files = <String>[];

    final libDir = Directory('lib');

    if (!libDir.existsSync()) {
      return files;
    }

    for (final entity in libDir.listSync(recursive: true)) {
      if (entity is File &&
          entity.path.endsWith('.dart')) {
        files.add(entity.path);
      }
    }

    return files;
  }
}