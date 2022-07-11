import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menu_dashboard_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  //Status bar arkaplan rengi ve yazı ve icon renklerini belirledik.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //Dik Görünüm (portrait) olarak görünmesini sağlar.
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Animated Menu',
      theme: ThemeData(primaryColor: Colors.red),
      home: const MenuDashboard(),
    );
  }
}
