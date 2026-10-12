import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Acceuil()));
}

class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => Destination())),
              );
            },
            child: Text('Navigation'),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  Destination({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Center(child: Text('Destination')));
  }
}
