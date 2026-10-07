import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.center,
            child: Text('data'),
          ),
        ),
      ),
    ),
  );
}
