import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            padding: const EdgeInsets.all(16),
            children: [
              Container(color: Colors.red),
              Container(color: Colors.blue),
              Container(color: Colors.green),
              Container(color: Colors.orange),
            ],
          ),
        ),
      ),
    ),
  );
}
