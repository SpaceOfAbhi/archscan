class ProjectSummaryBuilder {
  String build({
    required List<String> files,
    required List<String> dependencies,
    required String folderTree,
    required String architectureSignals,
  }) {
    final buffer = StringBuffer();

    buffer.writeln('Flutter Project Analysis');
    buffer.writeln();

    buffer.writeln('Dependencies:');

    for (final dependency in dependencies) {
      buffer.writeln('- $dependency');
    }

    buffer.writeln();

    buffer.writeln('Files:');

    for (final file in files) {
      buffer.writeln(file);
    }

    buffer.writeln('Folder Structure:');

    buffer.writeln(folderTree);

    buffer.writeln();

    buffer.writeln('Architecture Signals:');

    buffer.writeln(architectureSignals);

    return buffer.toString();
  }
}
