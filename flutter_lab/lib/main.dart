import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text('Bonjour Flutter'),),
          ),
        ),
      ),
    ),
  );
}
