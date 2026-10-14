import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent,
        brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('HOME'),
        centerTitle: true,
        leading: Icon(Icons.home),
        actions: [
          Icon(Icons.construction)
        ],
        backgroundColor: const Color.fromARGB(255, 159, 120, 6),
        ),
        body: Center(child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Image.asset('assets/images/logo.png', fit: BoxFit.cover,),
              )
            ],
          ),
        ),),
      ),
    ),
  );
}
