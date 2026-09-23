import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: ListeTags()),
      ),
    ),
  );
}

class ListeTags extends StatelessWidget {
  const ListeTags({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = [
      'Flutter', 'Dart', 'Mobile', 'Android', 'iOS',
      'Web', 'Desktop', 'Firebase', 'API REST', 'UI',
      'Animations', 'State Management', 'Widgets',
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: tags.map((tag) => Chip(label: Text(tag))).toList(),
      ),
    );
  }
}