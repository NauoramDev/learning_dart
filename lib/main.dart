import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState(); }
  

class _MyAppState extends State<MyApp>{
  bool isDark = false;
  List<(int,DateTime)> scores = [];

  void toggleTheme(){
    setState(() {
      isDark = !isDark;
    });
  }

@override
void initState(){
  super.initState();
  _loadScores();
}


Future<void> _loadScores() async {
  final pref = await SharedPreferences.getInstance();
  final String? scoreJson = pref.getString('scores');

  if(scoreJson != null){ // Si des scores sont enregistrés
    final List<dynamic> decodedList = jsonDecode(scoreJson);
    scores = decodedList.map((item) {
      final int value = item['value'];
      final DateTime date = DateTime.parse(item['date']);
      return (value, date);
    }).toList();
  }
  setState(() {}); // Met à jour l'interface utilisateur après le chargement des scores
}

Future<void> _saveScores() async{
  final pref = await SharedPreferences.getInstance();
  final List<Map<String, dynamic>> scoreList = scores.map((entry) {
    return {
      'value': entry.$1,
      'date': entry.$2.toIso8601String(),
    };
  }).toList();

  final String scoreJson = jsonEncode(scoreList);
  await pref.setString('scores', scoreJson);
}

@override
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