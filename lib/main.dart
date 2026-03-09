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
  List<HystoryObject> scores = [];

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
  final raw = await _storageService.loadScore(); // Charge les scores à partir du service de stockage
  setState(() {
    scores = raw; // Met à jour l'état avec les scores chargés
  });
}

// A modifier pour adapter les types
Future<void> _addScore(HystoryObject entry) async {
  setState(() {
    scores.add(entry);
  });
  await _saveScores();
}

Future<void> _clearScores() async {
  setState(() {
    scores.clear();
  });
  await _saveScores();
}

Future<void> _saveScores() async{
  await _storageService.saveScores(scores); // Sauvegarde les scores à l'aide du service de stockage
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
        onAddScore: _addScore,
        onClearScores: _clearScores,
        scores: scores,
      ),
    );
  }

}

// Finishhh