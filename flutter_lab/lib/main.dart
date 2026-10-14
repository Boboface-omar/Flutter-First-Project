import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: FilledButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Snackbar'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                  },
                  child: Text('Snackbar'),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
