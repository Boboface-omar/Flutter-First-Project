import 'package:flutter/material.dart';
import 'package:flutter_lab/data/notifiers.dart';
import 'package:flutter_lab/views/pages/homepage.dart';
import 'package:flutter_lab/views/pages/profile_page.dart';
import 'package:flutter_lab/views/widgets/navbar_widget.dart';

List<Widget> pages = [
  Homepage(),
  ProfilePage()
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Mapp'), centerTitle: true,),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (BuildContext context, dynamic selectedPage, Widget? child) {
          return  pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}