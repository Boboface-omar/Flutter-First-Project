import 'package:flutter/material.dart';

final ValueNotifier<int> _likesGlobal = ValueNotifier<int>(0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageUn());
  }
}

class PageUn extends StatelessWidget {
  const PageUn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: _likesGlobal,
                builder: (BuildContext context, int value, Widget? child) {
                  return Text('Likes : $value', style: TextStyle(fontSize: 30));
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _likesGlobal.value++;
                    },
                    child: Text('Ajouter +1'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _likesGlobal.value--;
                    },
                    child: Text('Enlever -1'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PageDeux()),
                      );
                    },
                    child: Text('Page 2'),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _likesGlobal.value = 0;
                  },
                  child: Text('Reinitialiser'),
                ),
              ),
            ],
          ),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: _likesGlobal,
                builder: (BuildContext context, int value, Widget? child) {
                  return Text('Likes : $value', style: TextStyle(fontSize: 30));
                },
              ),
              SizedBox(height: 10),
              Text(
                '(Cette page lit le même état global)',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _likesGlobal.value++;
                    },
                    child: Text('Ajouter +1'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _likesGlobal.value--;
                    },
                    child: Text('Enlever -1'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Retour'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
