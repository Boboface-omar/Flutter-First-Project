import 'package:flutter/material.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(
          child: Column(
            children: [
              Profil(),
            ],
          ),
        ),
      ),
    );
  }
}

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  int followers = 0;

  @override
  void initState() {
    super.initState();
    print('[_ProfilState] initState - Le widget est crée');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('[_ProfilState] didChangeDependencies - Les dépendances ont changé');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('[_ProfilState] deactivate - Le widget est temporairement retiré');
  }

  @override
  void dispose() {
    print('[_ProfilState] dispose - Le widget est détruit');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Profil Utilisateur'),
        const SizedBox(height: 16),
        Text('$followers followers'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              followers++;
            });
          },
          child: const Text('Suivre'),
        ),
      ],
    );
  }
}