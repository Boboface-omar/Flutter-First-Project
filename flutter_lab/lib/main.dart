import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget racine qui contient le MaterialApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const FormulairePage(),
    );
  }
}

// Écran de formulaire séparé
class FormulairePage extends StatefulWidget {
  const FormulairePage({super.key});

  @override
  State<FormulairePage> createState() => _FormulairePageState();
}

class _FormulairePageState extends State<FormulairePage> {
  final TextEditingController _nomCompletControler = TextEditingController();
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nomCompletControler.dispose();
    _emailControler.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulaire D'inscription"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _nomCompletControler,
              decoration: InputDecoration(
                labelText: 'Nom Complet',
                hintText: 'Oumar Bobo',
                prefixIcon: const Icon(Icons.face),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _emailControler,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Oumar@gamil.com',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                hintText: 'Votre Mot de passe sécurisé',
                prefixIcon: const Icon(Icons.password_outlined),
                suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Nom : ${_nomCompletControler.text}\nEmail : ${_emailControler.text}',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Connexion'),
            ),
          ],
        ),
      ),
    );
  }
}