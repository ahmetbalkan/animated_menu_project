import 'package:flutter/material.dart';

import 'menu_dashboard_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Menu',
      theme: ThemeData(primaryColor: Colors.red),
      home: const MenuDashboard(),
    );
  }
}
