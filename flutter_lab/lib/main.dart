import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        body: SafeArea(child: Center(
            child: Padding(padding: EdgeInsets.all(15),
            child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                    Chip(label: Text('Flutter')),
                    Chip(label: Text('Dart')),
                    Chip(label: Text('Nodejs')),
                    Chip(label: Text('Nodejs')),
                    Chip(label: Text('Nodejs')),
                    Chip(label: Text('Nodejs')),
                    Chip(label: Text('Nodejs')),
                    Chip(label: Text('Nodejs')),
                    Chip(label: Text('Nodejs')),
                    Chip(label: Text('Nodejs')),
                    Chip(label: Text('Nodejs')),
                ],
            ),
        )),
            )
    ),
  ));
}
