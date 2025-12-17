import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
    const MyApp({super.key});


@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Première Application'),
        backgroundColor: Colors.blueAccent,
      ),
      
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Hello World',
              style: TextStyle(
                          fontSize: 30,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.none
              ),
              ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: (){},
              child : const Text('Clique moi dessus !!!')
            ),
          ],
        ),
      ),
    );

  }
}