import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: Container(color: Colors.yellow)),
              Expanded(child: Container(color: Colors.blue)),
              Expanded(child: Container(color: Colors.red))
            ],
          ),
        ),
      ),
    ),
  );
}
