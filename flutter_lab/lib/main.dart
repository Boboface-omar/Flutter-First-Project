import 'package:flutter/material.dart';

void main() {
  final TextEditingController _controller = TextEditingController();
  print(_controller.text);       // Le texte tapé
_controller.clear();   
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: Scaffold(
    body: SafeArea(
      child: Padding(padding: EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.emailAddress,
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
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de Passe',
                hintText: 'Votre Mot de passe',
                prefixIcon: Icon(Icons.password_outlined),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.remove_red_eye_outlined)
              ),
            ),
             SizedBox(height: 20,)
            ,
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone',
                hintText: '70000012',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
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

