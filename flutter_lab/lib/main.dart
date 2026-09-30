import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        body: SafeArea(child: 
        Row(
            children: [
                 Expanded(flex: 1, child: Container(color: Colors.red)),    // 1 part
    Expanded(flex: 2, child: Container(color: Colors.blue)),   // 2 parts
    Expanded(flex: 3, child: Container(color: Colors.green)),  // 3 parts
            ],
        )),
    ),
  ));
}
