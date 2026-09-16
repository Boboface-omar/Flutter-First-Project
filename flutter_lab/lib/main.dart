import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: CounterPage(),
    ),
  );
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int compteur = 0;

  void incrementer() {
    setState(() {
      compteur++;
    });
  }

  void decrementer() {
    setState(() {
      compteur--;
    });
  }

  void reinitialiser() {
    setState(() {
      compteur = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon compteur'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$compteur',
              style: const TextStyle(
                fontSize: 50,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrementer,
                  child: const Text('-'),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: reinitialiser,
                  child: const Text('Reset'),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: incrementer,
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}