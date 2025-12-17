import 'package:flutter/material.dart';


class HistoryPage extends StatefulWidget {
  final bool isDark;
  final List<(int, DateTime)> scores;

  const HistoryPage({
    super.key,
    required this.isDark,
    required this.scores,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des Scores'),
        centerTitle: true,
        backgroundColor:
            widget.isDark ? Colors.deepPurple : Colors.blueAccent,
      ),
      body: widget.scores.isEmpty
          ? Center(child: Text('Aucun score enregistré.'))
          : ListView.builder(
              itemCount: widget.scores.length,
              itemBuilder: (context, index) {
                final reversedIndex = widget.scores.length - 1 - index;
                final entry = widget.scores[reversedIndex];
                final value = entry.$1;
                final date = entry.$2;
                String formattedDay =
                    '${date.day}/${date.month}/${date.year} - ${date.hour}:${date.minute}';

                return ListTile(
                  leading: Icon(Icons.arrow_forward),
                  title: Text(formattedDay),
                  subtitle: Text('$value'),
                );
              },
            ),
      );
  }
}
