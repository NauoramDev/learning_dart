import 'package:flutter/material.dart';
import './home_page.dart';
import 'storage_services.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState(); }
  

class _MyAppState extends State<MyApp>{
  final StorageService _storageService = StorageService();
  bool isDark = false;
  List<(int,DateTime)> scores = [];

  void toggleTheme(){
    setState(() {
      isDark = !isDark;
    });
  }

@override // Méthode d'initialisation pour charger les scores au démarrage de l'application
void initState(){
  super.initState();
  _loadScores();
}

Future<void> _loadScores() async {
  final raw = await _storageService.loadScore(); // Liste de Map (map = dico)
  setState(() {
    scores = raw
    .map((m) => (m['score'] as int, DateTime.parse(m['date'] as String)))
    .toList();
  });
}

Future<void> _saveScores() async{
  final raw = scores
  .map((e) => {
    'score' : e.$1,
    'date' : e.$2.toIso8601String(),
  },)
  .toList();
  await _storageService.saveScores(raw);
}

@override // Méthode de construction de l'interface utilisateur
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compteur',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        isDark: isDark,
        onToggleTheme: toggleTheme,
        saveScores: _saveScores,
        scores: scores,
      ),
    );
  }

}

// Finishhh