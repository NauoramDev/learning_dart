import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HystoryObject {
  final int score;
  final DateTime date;

  HystoryObject(this.score, this.date);
}



class StorageService {
  static const String fileName = 'scores.json';

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('$directory/$fileName');
  }

  Future<void> saveScores(List<HystoryObject> data) async {
    final file = await _getFile();
    final jsonString = jsonEncode(data);
    await file.writeAsString(jsonString);
  }

  Future<List<HystoryObject>> loadScore() async {
    final file = await _getFile();
    if (!await file.exists()) return []; // Si le fichier n'existe pas, alors il renvoie une liste vide
    final jsonString = await file.readAsString();
    final decoded = jsonDecode(jsonString);
    return (decoded as List)
    .map((e) => HystoryObject(e['score'] as int, DateTime.parse(e['date'] as String)))
    .toList();
  }
}

