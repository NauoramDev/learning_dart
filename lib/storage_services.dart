import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';



class StorageService {
  static const String fileName = 'scores.json';

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  Future<void> saveScores(List<Map<String, dynamic>> data) async {
    final file = await _getFile();
    final jsonString = jsonEncode(data);
    await file.writeAsString(jsonString);
  }

  Future<List<Map<String, dynamic>>> loadScore() async {
    final file = await _getFile();
    if (!await file.exists()) return []; // Si le fichier n'existe pas, alors il renvoie une liste vide
    final jsonString = await file.readAsString();
    final decoded = jsonDecode(jsonString);
    return List<Map<String, dynamic>>.from(decoded);
  }
}

