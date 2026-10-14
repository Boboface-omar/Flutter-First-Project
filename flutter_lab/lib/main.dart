import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 200,
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(color: Colors.amber, child: Center(child: Image.asset('assets/images/logo.png', fit: BoxFit.cover,),),);
              },
            ),
          ),
        ),
      ),
    ),
  );
}
