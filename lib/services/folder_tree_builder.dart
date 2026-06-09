import 'dart:io';

class FolderTreeBuilder {
  String buildTree() {
    final buffer = StringBuffer();

    _walk(
      Directory('lib'),
      '',
      buffer,
    );

    return buffer.toString();
  }

  void _walk(
    Directory dir,
    String indent,
    StringBuffer buffer,
  ) {
    final entities =
        dir.listSync().toList();

    for (final entity in entities) {
      final name =
          entity.path.split(
            Platform.pathSeparator,
          ).last;

      buffer.writeln(
        '$indent$name',
      );

      if (entity is Directory) {
        _walk(
          entity,
          '$indent  ',
          buffer,
        );
      }
    }
  }
}