import 'package:daaproject/screens/algorithmsScreen.dart';
import 'package:daaproject/screens/Algorithms/binarySearch.dart';
import 'package:daaproject/screens/Algorithms/linearSearch.dart';
import 'package:daaproject/screens/Algorithms/bubbleSort.dart';
import 'package:daaproject/screens/Algorithms/selectionSort.dart';
import 'package:daaproject/screens/Algorithms/insertionSort.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/menu.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Color myColor = Color.fromARGB(0, 0, 0, 0);
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
        '/insertionsort': (context) => InsertionSort(),
      },
    );
  }
}
