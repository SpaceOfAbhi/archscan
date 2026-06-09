class ProjectSummaryBuilder {
  String build({
    required List<String> files,
    required List<String> dependencies,
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

    return buffer.toString();
  }
}