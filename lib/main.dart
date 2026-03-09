import 'package:flutter/material.dart';
import './home_page.dart';
import 'storage_services.dart';
import './history_page.dart';
import './setting_page.dart';


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
  int currentIndex = 0;
  final List<String> titles = ['Compteur', 'Historique', 'Paramètre'];

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
      home: Scaffold(
        appBar: AppBar(
        title: Text(titles[currentIndex], style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: isDark? Colors.deepPurple : Colors.blueAccent 
      ),
        body: IndexedStack(
          index : currentIndex,
          children: [
            HomePage(
              isDark: isDark,
              onToggleTheme: toggleTheme,
            onAddScore: _addScore,
            onClearScores: _clearScores,
            scores: scores,
          ),
          HistoryPage(
            isDark: isDark,
            scores: scores,
          ),
          SettingPage(
            isDark: isDark,
            onToggleTheme: toggleTheme,
            onClearScores: _clearScores,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Compteur'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historique'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting')
        ],
      ),
    ),
    );
  }

}

// Finishhh