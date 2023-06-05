import 'package:daaproject/screens/algorithmsScreen.dart';
import 'package:daaproject/screens/Algorithms/binarySearch.dart';
import 'package:daaproject/screens/Algorithms/linearSearch.dart';
import 'package:daaproject/screens/Algorithms/bubbleSort.dart';
import 'package:daaproject/screens/Algorithms/selectionSort.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/menu.dart';

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
        '/linearsearch': (context) => LinearSearch(),
        '/binarysearch': (context) => BinarySearch(),
        '/bubblesort': (context) => BubbleSort(),
        '/selectionsort': (context) => SelectionSort(),
      },
    );
  }
}
