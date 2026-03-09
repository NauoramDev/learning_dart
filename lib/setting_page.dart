import 'package:flutter/material.dart';
import 'package:learning_code/storage_services.dart';

class SettingPage extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;
  final List<HystoryObject> scores;

  const SettingPage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.scores,
  });

  void clearScores() {
    scores.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        centerTitle: true,
        backgroundColor:
            isDark ? Colors.deepPurple : Colors.blueAccent,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onToggleTheme,
              child: Text(isDark ? 'Passer au mode clair' : 'Passer au mode sombre'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: clearScores,
              child: Text('Effacer l\'historique des scores')
            ),
          ],
        ),
      ),
    );
  }
}