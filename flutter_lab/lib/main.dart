import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: ListView.builder(
  itemCount: 20,
  itemBuilder: (context, index) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(child: Text('${index + 1}')),
        title: Text('Produit ${index + 1}'),
        subtitle: Text('Description du produit'),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          print('Clic sur le produit ${index + 1}');
        },
      ),
    );
  },
)),
      ),
    ),
  );
}
