import 'package:flutter/material.dart';

void main(){ // LA fonction principale qui se lance des qu'on lance le code
  runApp (const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
}
}

// Création de la page d'accueil 
class Home extends StatelessWidget{
  const Home({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Première Application'),
        backgroundColor: Colors.blueAccent,
      ), // Permet d'ajouter une AppBar
      body: Center( // Le body permer de configurer ce qu'il y aura dans le Scaffold
        child : Text(
          'Hello World',
            style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        color: Colors.blueAccent,
                    ),
        )
      ),

    );
  }
}
