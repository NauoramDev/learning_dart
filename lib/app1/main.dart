import 'package:flutter/material.dart';
import 'setting_page.dart';
import 'second_page.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});


@override
State<MyApp> createState() => _MyAppState();
}

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
      title : 'Mon Application',
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
        isDark : isDark,
        onToggleTheme : toggleTheme,
      ),
    );
  }
}

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
  final TextEditingController _textController = TextEditingController();


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon application Flutter'),
        backgroundColor: widget.isDark ? Colors.deepPurple : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.isDark ? 'Mode Sombre' : 'Mode Clair',
              style: TextStyle(
                        fontSize: 24,
                        decoration: TextDecoration.none),
            ),
            const SizedBox(height: 15),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('assets/images/captain.png', width: 150),
              const SizedBox(width: 10),
            Image.network('https://picsum.photos/200/200?random=1', height: 150,
            ),
            ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: widget.onToggleTheme,
              child: Text(
                'Changer de thème',
                style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.none,
                      color: widget.isDark ? Colors.purpleAccent : Colors.blueAccent),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondPage(message: 'page 1',)));
              },
              child: Text(
                'Changer de page ?',
                style: TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.none,
                  fontSize: 18
                ),
              ),
            ),
            Padding(
              padding : EdgeInsets.all(15),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Ecrit une valeur'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child : ElevatedButton(
                child: Text('Valider'),
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(message: _textController.text)
                  ));
                },
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: (){}, // On met rien car page principal
              icon: Icon(Icons.home)
            ),
            IconButton(
              icon: Icon(Icons.phishing),
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondPage(message: 'page 1 bis',)));
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}


