import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: Scaffold(
    body: SafeArea(
      child: Padding(padding: EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Diallo123@gmail.com',
                prefixIcon: Icon(Icons.mail_outline),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,)
            ,
            TextField(
              decoration: InputDecoration(
                labelText: 'Mot de Passe',
                hintText: 'Votre Mot de passe',
                prefixIcon: Icon(Icons.password_outlined),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.remove_red_eye_outlined)
              ),
            )
          ],
        ),
      ),
      ),
    ),
  ),
  ));
}
