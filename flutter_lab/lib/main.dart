import 'dart:async';
import 'package:flutter/material.dart';

class Horloge extends StatefulWidget {
  const Horloge({super.key});

  @override
  State<Horloge> createState() => _HorlogeState();
}

class _HorlogeState extends State<Horloge> {
  late DateTime heure;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    heure = DateTime.now();
    
    // Un timer qui redessine l'écran toutes les secondes
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (mounted) {
        setState(() {
          heure = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();  // ⚠️ CRUCIAL : sinon le timer tourne pour toujours
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${heure.hour}:${heure.minute}:${heure.second}',
      style: const TextStyle(fontSize: 30),
    );
  }
}