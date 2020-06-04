import 'package:flutter/material.dart';
import 'package:qrcode/screens/scancode.dart';
import './screens/homepage.dart';
import './screens/scancode.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => ScanScreen(),
      },
    );
  }
}
