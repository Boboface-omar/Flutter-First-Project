import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: Scaffold(
    body: SafeArea(child: 
    Row(
        children: [
            Flexible(
                fit: FlexFit.tight,
                child: Text('Un texte très long qui peut prendre plusieurs lignes')),
            Icon(Icons.stars)
        ],
    )
    ),
  ),
  ));
}
