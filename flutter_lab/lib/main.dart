import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Apprendre Flutter'),
        ),
        body: Center(
          child: Column(
            children: [Text('Salut j\'apprend Flutter'),
            Text('Hello World')],
          ),
        ),
      ),
    )
  );
}