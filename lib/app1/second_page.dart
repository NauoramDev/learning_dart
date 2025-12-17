import 'package:flutter/material.dart';




class SecondPage extends StatelessWidget{
  final String message;

  const SecondPage({super.key,
                    required this.message});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message),
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
