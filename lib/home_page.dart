import 'package:flutter/material.dart';
import 'package:learning_code/storage_services.dart';
import './history_page.dart';
import './setting_page.dart';

class HomePage extends StatefulWidget{
  final bool isDark;
  final VoidCallback onToggleTheme;
  final Future<void> Function() saveScores;
  final List<HystoryObject> scores;

  const HomePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.saveScores,
    required this.scores, // liste de tuples (int, DateTime) représentant les scores et leurs dates associées
  });
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int counter = 0;
  List<HystoryObject> scores = [];

  void incrementCounter(int value){
    setState(() { // SetState est utilisé pour notifier Flutter que l'état de l'application a changé et que l'interface utilisateur doit être reconstruite pour refléter ces changements.
      counter += value; 
    });
  }

  void addScore(){
    final date = DateTime.now();
    setState(() {
      scores.add(HystoryObject(counter, date)); // Ajoute un nouveau score à la liste des scores
      counter = 0; // Réinitialise le compteur à zéro après l'ajout du score
    });
    widget.saveScores(); // Appelle la fonction de sauvegarde des scores pour enregistrer les scores mis à jour    
  }
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compteur', style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: widget.isDark? Colors.deepPurple : Colors.blueAccent 
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Compteur :',
            style: TextStyle(
              fontSize: 30,
              color: widget.isDark? Colors.deepPurple : Colors.blueAccent),
          ),
          SizedBox(height: 15),
          Text('$counter', style: TextStyle(fontSize: 30)),
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Row est utilisé pour aligner les boutons horizontalement avec un espacement égal entre eux (spaceEvenly)
          children: [
            ElevatedButton(child: Text('+1'),
            onPressed: () => incrementCounter(1),),
            ElevatedButton(child: Text('+5'),
            onPressed: () => incrementCounter(5),),
            ElevatedButton(child: Text('-1'),
            onPressed: () => incrementCounter(-1),),
            ElevatedButton(child: Text('-5'),
            onPressed: () => incrementCounter(-5),),
          ],),
          SizedBox(height: 50),
          ElevatedButton(child: Text('Ajouter score'), onPressed: () => addScore())
        ],
      ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.home)),
          IconButton(onPressed:() {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => HistoryPage(isDark: widget.isDark, scores: scores)));
          }, icon: Icon(Icons.menu)),
          IconButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => SettingPage(isDark: widget.isDark, onToggleTheme: widget.onToggleTheme, scores: scores)));

          }, icon: Icon(Icons.settings))
        ],),
      ),
    );
  }
}