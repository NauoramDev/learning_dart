import 'package:flutter/material.dart';
import './history_page.dart';
import './setting_page.dart';

class HomePage extends StatefulWidget{
  final bool isDark;
  final VoidCallback onToggleTheme;
  const HomePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme
  });
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int counter = 0;
  List<(int,DateTime)> scores = [];

  void incrementCounter(int value){
    setState(() {
      counter += value;
    });
  }

  void addScore(){
    DateTime date = DateTime.now();
    setState(() {
      scores.add((counter, date));
      counter = 0;
    });
  }
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compteur'),
        centerTitle: true,
        backgroundColor: widget.isDark? Colors.deepPurple : Colors.blueAccent 
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Compteur :',
            style: TextStyle(
              fontSize: 35,
              color: widget.isDark? Colors.deepPurple : Colors.blueAccent),
          ),
          SizedBox(height: 15),
          Text('$counter', style: TextStyle(fontSize: 30)),
          SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(child: Text('+1'),
            onPressed: ()=> incrementCounter(1),),
            ElevatedButton(child: Text('+5'),
            onPressed: ()=> incrementCounter(5),),
            ElevatedButton(child: Text('-1'),
            onPressed: ()=> incrementCounter(-1),),
            ElevatedButton(child: Text('-5'),
            onPressed: ()=> incrementCounter(-5),),
          ],),
          SizedBox(height: 15),
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