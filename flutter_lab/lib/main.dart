import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: ListView(
          children: [
            ListTile(title: Text('data'),),
            ListTile(title: Text('data'),),
            ListTile(title: Text('data'),),
            ListTile(title: Text('data'),)
          ],
        )),
      ),
    ),
  );
}
