import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) => ListTile(
                leading: Image.asset('assets/images/logo.png'),
                title: Text('List'),
                subtitle: Text('SousTitre'),
                trailing: Image.asset('assets/images/logo.png'),
              ),
          ),
        ),
      ),
    ),
  );
}
