import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() async {
  final settings = await loadSettings();
  print(settings); // Example usage
}

const Map<String, dynamic> defaultSettings = {
  "news": "https://ground.news",
  "gmail": "https://mail.proton.me",
  "calendar": "https://calendar.proton.me/",
};

Future<File> get _localFile async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    final exeDir = File(Platform.resolvedExecutable).parent.path;
    final filePath = p.join(exeDir, 'settings.json');
    return File(filePath);
  }
  else {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/settings.json');
  }
}

Future<Map<String, dynamic>> loadSettings() async {
  try {
    final file = await _localFile;

    if (!await file.exists()) {
      return defaultSettings; // return default settings
    }

    final contents = await file.readAsString();
    return jsonDecode(contents);
  } catch (e) {
    return defaultSettings;
  }
}

Future<void> saveSettings(Map<String, dynamic> json) async {
  final file = await _localFile;

  final jsonString = jsonEncode(json);

  await file.writeAsString(jsonString);
}
