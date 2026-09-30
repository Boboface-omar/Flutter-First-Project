import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(child: Icon(Icons.home, color: Colors.blue)),
                  Expanded(child: Icon(Icons.search, color: Colors.grey)),
                  Expanded(child: Icon(Icons.favorite, color: Colors.grey)),
                  Expanded(child: Icon(Icons.person, color: Colors.grey)),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
