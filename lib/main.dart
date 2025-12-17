import 'package:flutter/material.dart';
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

  void toggleTheme(){
    setState(() {
      isDark = !isDark;
    });
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
      ),
    );
  }

}

// Finishhh