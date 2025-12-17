import 'package:flutter/material.dart';


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


class HomePage extends StatelessWidget{
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon application Flutter'),
        backgroundColor: isDark ? Colors.deepPurple : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isDark ? 'Mode Sombre' : 'Mode Clair',
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
            )
            ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: onToggleTheme,
              child: Text(
                'Changer de thème',
                style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.none,
                      color: isDark ? Colors.purpleAccent : Colors.blueAccent),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondPage()));
              },
              child: Text(
                'Changer de page ?',
                style: TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.none,
                  fontSize: 18
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class SecondPage extends StatelessWidget{
  const SecondPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Page TWO papapa'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            'Salem W3leykoum khoya ! Comment ça va ? ',
            style: TextStyle(
              fontSize: 24,
              decoration: TextDecoration.none
            ),
          ),
        ),
      ),
    );
  }
}