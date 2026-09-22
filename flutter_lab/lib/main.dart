import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: ResponsiveExample())));
}

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height.toStringAsFixed(0);
    return Center(child: Text('Largeur : $height'));
  }
}
