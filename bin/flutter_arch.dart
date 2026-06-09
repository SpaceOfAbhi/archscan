import 'dart:io';

import 'package:flutter_arch/services/architecture_signal_builder.dart';
import 'package:flutter_arch/services/config_service.dart';
import 'package:flutter_arch/services/folder_tree_builder.dart';
import 'package:flutter_arch/services/groq_service.dart';
import 'package:flutter_arch/services/project_scanner.dart';
import 'package:flutter_arch/services/project_summary_builder.dart';
import 'package:flutter_arch/services/pubspec_reader.dart';

Future<void> main(List<String> arguments) async {
  final config = ConfigService();

  if (arguments.contains('help')) {
    print('''
      flutter_arch

      Analyze Flutter project architecture using AI.

      Commands:

      flutter_arch        Analyze current project
      flutter_arch key    Update Groq API key
      flutter_arch help   Show help
      ''');

    return;
  }

  // Update API key
  if (arguments.contains('key')) {
    stdout.write('Enter New Groq API Key: ');

    final newKey = stdin.readLineSync();

    if (newKey == null || newKey.trim().isEmpty) {
      print('❌ Invalid API Key');
      return;
    }

    await config.saveApiKey(newKey);

    print('\n✓ API Key Updated');
    return;
  }

  // Get API key
  String apiKey;

  final existingKey = await config.getApiKey();

  if (existingKey == null || existingKey.trim().isEmpty) {
    stdout.write('Enter Groq API Key: ');

    final key = stdin.readLineSync();

    if (key == null || key.trim().isEmpty) {
      print('❌ Invalid API Key');
      return;
    }

    await config.saveApiKey(key);

    print('\n✓ API Key Saved\n');

    apiKey = key;
  } else {
    apiKey = existingKey;
  }

  // Validate Flutter project
  final scanner = ProjectScanner();

  if (!scanner.isFlutterProject()) {
    print('❌ Not a Flutter project');
    return;
  }

  // Scan project
  final files = scanner.getDartFiles();

  final dependencies = PubspecReader().getDependencies();

  final folderTree = FolderTreeBuilder().buildTree();

  final architectureSignals = ArchitectureSignalBuilder().build(
    files,
    dependencies,
  );

  final summary = ProjectSummaryBuilder().build(
    files: files,
    dependencies: dependencies,
    folderTree: folderTree,
    architectureSignals: architectureSignals,
  );

  print(summary);

  print('\n🔍 Analyzing project architecture...\n');

  try {
    final review = await GroqService(apiKey).analyzeProject(summary);
     final stopwatch = Stopwatch()..start();

    print(review);
    stopwatch.stop();
  } catch (e) {
    print('❌ Failed to analyze project.\n');

    print(e);
  }
}
