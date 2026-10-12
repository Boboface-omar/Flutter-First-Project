import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,     // Ratio largeur/hauteur
            ),
            itemCount: 20,
            itemBuilder: (context, index) => Container(
                color: Colors.blue.shade100,
      child: Center(child: Text('Item $index')),
            ),
          ),
        ),
      ),
    ),
  );
}
