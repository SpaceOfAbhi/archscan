import 'dart:convert';
import 'dart:io';

class ConfigService {
  final Directory configDir =
      Directory(
        '${Platform.environment['USERPROFILE'] ?? Platform.environment['HOME']}\\.archscan',
      );

  File get configFile =>
      File('${configDir.path}\\config.json');

  Future<void> saveApiKey(
    String apiKey,
  ) async {
    if (!configDir.existsSync()) {
      configDir.createSync(
        recursive: true,
      );
    }

    await configFile.writeAsString(
      jsonEncode({
        'groqApiKey': apiKey,
      }),
    );
  }

  Future<String?> getApiKey() async {
    if (!configFile.existsSync()) {
      return null;
    }

    final content =
        await configFile.readAsString();

    final json =
        jsonDecode(content);

    return json['groqApiKey'];
  }
}