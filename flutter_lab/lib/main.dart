import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: ListView.builder(
          itemCount: 1000,
          itemBuilder: (context, index) => ListTile(title: Text('data $index'),),
        )),
      ),
    ),
  );
}
