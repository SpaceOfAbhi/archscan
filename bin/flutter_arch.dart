import 'package:flutter_arch/services/project_scanner.dart';
import 'package:flutter_arch/services/project_summary_builder.dart';
import 'package:flutter_arch/services/pubspec_reader.dart';

void main(List<String> arguments) {
  final scanner = ProjectScanner();

  if (!scanner.isFlutterProject()) {
    print('❌ Not a Flutter project');
    return;
  }

  final files = scanner.getDartFiles();

  final reader = PubspecReader();
  final dependencies = reader.getDependencies();

  final summaryBuilder = ProjectSummaryBuilder();

  final summary = summaryBuilder.build(
    files: files,
    dependencies: dependencies,
  );

  print(summary);
}