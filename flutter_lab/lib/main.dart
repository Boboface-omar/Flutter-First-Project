import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Flutter'),
//               SizedBox(height: 15),
//               Text('Développement'),
//               SizedBox(height: 20),
//               Text('Mobile & Web'),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('[ + ]'),
              SizedBox(width: 15),
              Text('[ Reset ]'),
              SizedBox(width: 15),
              Text('[ - ]'),
            ],
          ),
        ),
      ),
    ),
  );
}