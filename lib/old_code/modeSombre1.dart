import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
  bool isDark = false;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text('Mon Application'),
        backgroundColor: isDark ? Colors.purpleAccent : Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isDark ? 'Mode Sombre' : 'Mode Clair',
              style: TextStyle(
                    fontSize: 30,
                    color: isDark ? Colors.purpleAccent : Colors.blueAccent,
                    decoration: TextDecoration.none
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  isDark = !isDark;
                });
              }, 
            child: Text(
                    isDark ? 'Passez en Clair' : 'Passez en Sombre',
                    )
            )
          ],
        ),
      ),
    );
  }
}
