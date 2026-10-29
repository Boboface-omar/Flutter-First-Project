import 'package:flutter/material.dart';

final ValueNotifier<bool> _eclairage = ValueNotifier<bool>(true);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _eclairage,
      builder: (context, isLight, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
          home: const Homepage(),
        );
      },
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mode'),
        actions: [
          IconButton(
            onPressed: () {
              _eclairage.value = !_eclairage.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: _eclairage,
              builder: (BuildContext context, bool value, Widget? child) {
                return Icon(value ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
        ],
      ),
    );
  }
}
