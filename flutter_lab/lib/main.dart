import 'package:flutter/material.dart';

final ValueNotifier<int> _scoreGoal = ValueNotifier<int>(0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PageUn());
  }
}

class PageUn extends StatelessWidget {
  const PageUn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _scoreGoal,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Text('Score : $value');
              },
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                _scoreGoal.value++;
              },
              child: Text('Ajouter + 1'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageDeux();
                    },
                  ),
                );
              },
              child: Text('Aller à la Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageDeux extends StatelessWidget {
  const PageDeux({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _scoreGoal,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Text('Score : $value');
              },
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                _scoreGoal.value++;
              },
              child: Text('Ajouter +1'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, PageUn());
              },
              child: Text('Retour'),
            ),
          ],
        ),
      ),
    );
  }
}
