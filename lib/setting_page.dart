import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;
  final List<(int, DateTime)> scores;

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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: onToggleTheme,
              child: Text(isDark ? 'Passer au mode clair' : 'Passer au mode sombre'),
            ),
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