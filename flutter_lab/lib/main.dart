import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              SizedBox(width: 15),
              Flexible(child: Text('Oumar Bobo Diallo',
              overflow: TextOverflow.ellipsis,)),
            ],
          ),
        ),
      ),
    ),
  );
}
