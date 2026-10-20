import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Nom Complet',
                  hintText: 'Oumar Diallo',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                ),
              ),
              const SizedBox(height: 20,),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Diallo@gmail.com',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                ),
              ),
               const SizedBox(height: 20,),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Diallo@gmail.com',
                  prefixIcon: Icon(Icons.password_sharp),
                  suffixIcon: Icon(Icons.remove_red_eye_sharp),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                ),
              ),
              const SizedBox(height: 30,),
              Center(
                child: FilledButton(onPressed : () {}, child: const Text('Connecter')),
              )
            ],
          ),
        )),
      ),
    );
  }
}