import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;
  final VoidCallback onClearScores;

  const SettingPage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.onClearScores,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onToggleTheme,
            child: Text(isDark ? 'Passer au mode clair' : 'Passer au mode sombre'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onClearScores,
            child: Text('Effacer l\'historique des scores')
          ),
        ],
      ),
    );
  }
}