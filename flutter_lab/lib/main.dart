import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MemoirePage(),
    );
  }
}

class MemoirePage extends StatefulWidget {
  const MemoirePage({super.key});

  @override
  State<MemoirePage> createState() => _MemoirePageState();
}

class _MemoirePageState extends State<MemoirePage> {
  final TextEditingController _nomController = TextEditingController();
  late SharedPreferences _prefs;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _chargerNom();
  }

  // ⚠️ FIX 4 : Le dispose
  @override
  void dispose() {
    _nomController.dispose();
    super.dispose();
  }

  Future<void> _chargerNom() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _nomController.text = _prefs.getString('nom_utilisateur') ?? '';
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ⚠️ FIX 3 : Ajout du Scaffold
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: 'Ton Nom'),
            ),
            const SizedBox(height: 20),
            
            // ⚠️ FIX 5 : onPressed devient async
            ElevatedButton(
              onPressed: () async {
                // ⚠️ FIX 1 : Clé corrigée
                await _prefs.setString('nom_utilisateur', _nomController.text);
                
                // ⚠️ FIX 2 : Pas de setState pour le SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Nom sauvegardé !')),
                );
              },
              child: const Text('Sauvegarder'),
            ),
          ],
        ),
      ),
    );
  }
}