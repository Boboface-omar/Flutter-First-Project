import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: MonCompteur())));
}

class MonCompteur extends StatefulWidget {
  const MonCompteur({super.key});

  @override
  State<MonCompteur> createState() => _MonCompteurState();
}

class _MonCompteurState extends State<MonCompteur> {
  int clics = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Clics : $clics', style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                clics++;
              });
            },
            child: const Text('Cliquer ici'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                clics = 0;
              });
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
