import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Row(
        children: [
          Text('Accueil'),
          Spacer(),
          Icon(Icons.search),
          Spacer(),
          Text('Profil')
        ],
      ),
    ),
  ));
}
