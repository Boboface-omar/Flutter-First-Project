// import 'package:flutter/material.dart';

// final ValueNotifier<int> _scoreGlobal = ValueNotifier<int>(0);

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: PageUn(),
//     );
//   }
// }

// class PageUn extends StatelessWidget {
//   const PageUn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Page 1'), centerTitle: true),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ValueListenableBuilder<int>(
//               valueListenable: _scoreGlobal,
//               // ⚠️ Typé en int
//               builder: (context, int value, child) {
//                 return Text('Score : $value', style: const TextStyle(fontSize: 24));
//               },
//             ),
//             const SizedBox(height: 15.0),
//             ElevatedButton(
//               onPressed: () {
//                 _scoreGlobal.value++;
//               },
//               child: const Text('Ajouter +1'),
//             ),
//             const SizedBox(height: 10.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const PageDeux(),
//                   ),
//                 );
//               },
//               child: const Text('Aller à la Page 2'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PageDeux extends StatelessWidget {
//   const PageDeux({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Page 2'), centerTitle: true),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ValueListenableBuilder<int>(
//               valueListenable: _scoreGlobal,
//               builder: (context, int value, child) {
//                 return Text('Score : $value', style: const TextStyle(fontSize: 24));
//               },
//             ),
//             const SizedBox(height: 15.0),
//             ElevatedButton(
//               onPressed: () {
//                 _scoreGlobal.value++;
//               },
//               child: const Text('Ajouter +1'),
//             ),
//             const SizedBox(height: 10.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context); // ⚠️ Correction
//               },
//               child: const Text('Retour'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

ValueNotifier<int> _compteur = ValueNotifier<int>(0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Compteur());
  }
}

class Compteur extends StatelessWidget {
  const Compteur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: _compteur,
                builder: (BuildContext context, int value, Widget? child) {
                  return Text('Score : $value');
                },
              ),
              SizedBox(height: 20),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _compteur.value++;
                    },
                    child: Text('Ajouter +1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _compteur.value--;
                    },
                    child: Text('Reduire -1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PageDeux(),
                        ),
                      );
                    },
                    child: Text('Page Deux'),
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

class PageDeux extends StatelessWidget {
  const PageDeux({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: _compteur,
                builder: (BuildContext context, int value, Widget? child) {
                  return Text('Score : $value');
                },
              ),
              SizedBox(height: 20),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _compteur.value++;
                    },
                    child: Text('Ajouter +1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _compteur.value--;
                    },
                    child: Text('Reduire -1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Page Une'),
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
