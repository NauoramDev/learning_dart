import 'package:flutter/material.dart';


class SettingPage extends StatelessWidget{
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('C\'est les Paramètres',
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline
            ),)
          ],
        ),
      ),
    );
  }
}