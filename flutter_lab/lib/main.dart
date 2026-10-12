import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Messages'),),
        body: SafeArea(child: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) => 
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.message),),
            title: Text('Oumar'),
            subtitle: Text('Salut Oumar'),
            trailing: Text('22h'),
            onTap: () => SnackBar(content: Text('Message Lu')),

          ),
          separatorBuilder: (context, index) => Divider(),
        )),
      ),
    )
  );
}