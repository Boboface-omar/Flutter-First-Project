// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.teal,
//           brightness: Brightness.dark,
//         ),
//       ),
//       home:  ApiPage(),
//     );
//   }
// }

// class ApiPage extends StatelessWidget {
//    ApiPage({super.key});

//   // ⚠️ FIX 4 : Le Future est stocké une seule fois
//   late final Future<List<Map<String, dynamic>>> _futureUsers = _recupUsers();

//   Future<List<Map<String, dynamic>>> _recupUsers() async {
//     final response = await http.get(
//       Uri.parse('https://jsonplaceholder.typicode.com/users'),
//     );

//     if (response.statusCode == 200) {
//       final decoded = jsonDecode(response.body);
//       return List<Map<String, dynamic>>.from(decoded);
//     } else {
//       throw Exception('Erreur HTTP : ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Utilisateurs'),
//         centerTitle: true,
//         leading: const Icon(Icons.person_search),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: _futureUsers,
//         builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 'Erreur : ${snapshot.error}',
//                 style: const TextStyle(color: Colors.red),
//               ),
//             );
//           }

//           final users = snapshot.data!;

//           return ListView.separated(
//             padding: const EdgeInsets.all(15.0),
//             itemCount: users.length, // ⚠️ FIX 2 : length
//             itemBuilder: (context, index) {
//               final user = users[index];

//               return Card(
//                 margin: EdgeInsets.zero, // On gère l'espace avec le separator
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     children: [
//                       // ⚠️ FIX 3 : NetworkImage
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundImage: NetworkImage(
//                           'https://i.pravatar.cc/150?u=${user['id']}',
//                         ),
//                       ),
//                       const SizedBox(width: 16),

//                       // ⚠️ FIX 5 : Structure Column demandée
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               user['name'] ?? 'Sans nom',
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               user['email'] ?? 'Pas d\'email',
//                               style: const TextStyle(color: Colors.grey),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               user['address']['city'] ?? 'Ville inconnue',
//                               style: const TextStyle(color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             // ⚠️ FIX 5 (suite) : SizedBox au lieu de Divider
//             separatorBuilder: (context, index) => const SizedBox(height: 10),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087F73),
          surface: const Color(0xFFF5F7F7),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F7F7),
          foregroundColor: Color(0xFF172B2A),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const UsersList(),
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  Future<List<Map<String, dynamic>>> get _futureUsers => _recupUsers();

  Future<List<Map<String, dynamic>>> _recupUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(decoded);
    } else {
      throw Exception('Erreur Api : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mon espace',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(Icons.grid_view_rounded),
        ),
        leadingWidth: 48,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureUsers,
        builder:
            (
              BuildContext context,
              AsyncSnapshot<List<Map<String, dynamic>>> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        'Chargement des utilisateurs...',
                        style: TextStyle(color: Color(0xFF687775)),
                      ),
                    ],
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.cloud_off_rounded,
                          size: 44,
                          color: Color(0xFFB54747),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Impossible de charger les utilisateurs',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Color(0xFF687775)),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final users = snapshot.data ?? const <Map<String, dynamic>>[];

              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                itemCount: users.isEmpty ? 1 : users.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ANNUAIRE',
                          style: TextStyle(
                            color: Color(0xFF087F73),
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Vos utilisateurs',
                                style: TextStyle(
                                  color: Color(0xFF172B2A),
                                  fontSize: 27,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE0F2EF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${users.length} membres',
                                style: const TextStyle(
                                  color: Color(0xFF087F73),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Retrouvez facilement les personnes de votre équipe.',
                          style: TextStyle(
                            color: Color(0xFF687775),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 22),
                        if (users.isEmpty)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: Center(
                              child: Text(
                                'Aucun utilisateur pour le moment.',
                                style: TextStyle(color: Color(0xFF687775)),
                              ),
                            ),
                          ),
                        if (users.isNotEmpty) _userCard(context, users[0]),
                      ],
                    );
                  }

                  return _userCard(context, users[index]);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
              );
            },
      ),
    );
  }

  Widget _userCard(BuildContext context, Map<String, dynamic> user) {
    final name = user['name'] as String? ?? 'Pas de nom';
    final email = user['email'] as String? ?? 'Pas d’email';

    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFE8EEEC)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFFE0F2EF),
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?u=${user['id']}',
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF172B2A),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.mail_outline_rounded,
                        size: 14,
                        color: Color(0xFF82908E),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF687775),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              tooltip: 'Ajouter $name',
              onPressed: () {
                // ScaffoldMessenger.of(context)
                //     .showSnackBar(SnackBar(content: Text('$name ajouté')));
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PageDetail()));
              },
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFE0F2EF),
                foregroundColor: const Color(0xFF087F73),
                fixedSize: const Size(40, 40),
              ),
              icon: const Icon(Icons.person_add_alt_1_rounded, size: 19),
            ),
          ],
        ),
      ),
    );
  }
}

class PageDetail extends StatelessWidget {
  const PageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('DETAIL', style: TextStyle(fontSize: 40, color: Colors.amber),),),);
  }
}
