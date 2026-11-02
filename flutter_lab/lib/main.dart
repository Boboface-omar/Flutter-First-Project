import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ParametresPage();
  }
}

class ParametresPage extends StatefulWidget {
  const ParametresPage({super.key});

  @override
  State<ParametresPage> createState() => _ParametresPageState();
}

class _ParametresPageState extends State<ParametresPage> {
  int _compteur = 0;
  bool _modeSombre = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _chargerDonnees();
  }

  Future<void> _chargerDonnees() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _compteur = _prefs.getInt('compteur') ?? 0;
      _modeSombre = _prefs.getBool('modeSombre') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _modeSombre ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Preferences'), centerTitle: true),
        body: Column(
          children: [
            Text('Compteur : $_compteur', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _compteur++;
                _prefs.setInt('compteur', _compteur);
              },
              child: Text('+1'),
            ),
            SizedBox(height: 15),
            SwitchListTile(
              value: _modeSombre,
              onChanged: (value) {
                setState(() {
                  _modeSombre = value;
                  _prefs.setBool('modeSombre', value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
