import 'package:daaproject/screens/algorithmsScreen.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/menu.dart';
import 'widgets/Algorithms/bubbleSort.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyAlgorithmsScreen(),
      routes: {
        '/': (context) => MyHome(),
        '/menu': (context) => MyMenu(),
        '/algorithmsscreen': (context) => MyAlgorithmsScreen(),
      },
    );
  }
}
