import 'package:flutter/material.dart';
import 'package:learning_code/storage_services.dart';
import './history_page.dart';
import './setting_page.dart';

class HomePage extends StatefulWidget{
  final bool isDark;
  final VoidCallback onToggleTheme;
  final Future<void> Function(HystoryObject) onAddScore;
  final VoidCallback onClearScores;
  final List<HystoryObject> scores;

  const HomePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.onAddScore,
    required this.onClearScores,
    required this.scores,
  });
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int counter = 0;

  void incrementCounter(int value){
    setState(() {
      counter += value; 
    });
  }

  Future<void> addScore() async {
    final date = DateTime.now();
    await widget.onAddScore(HystoryObject(counter, date));
    setState(() {
      counter = 0;
    });
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
            MaterialPageRoute(builder: (context) => HistoryPage(isDark: widget.isDark, scores: widget.scores)));
          }, icon: Icon(Icons.menu)),
          IconButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => SettingPage(isDark: widget.isDark, onToggleTheme: widget.onToggleTheme, onClearScores: widget.onClearScores)));

          }, icon: Icon(Icons.settings))
        ],),
      ),
    );
  }
}