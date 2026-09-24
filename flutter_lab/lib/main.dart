import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(body: Stack(children: [
        Center(child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.purple.shade200,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Center(child: Text('CENTRE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
        ),),
        Padding(
          padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.topRight,
          child: Text('Coin haut-droit', style: TextStyle(fontSize: 16, color: Colors.red),),
        )),
        Padding(
          padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text('Coin haut-droit', style: TextStyle(fontSize: 16, color: Colors.green),),
        )),
          ],
        )),
    ),
  );
}
