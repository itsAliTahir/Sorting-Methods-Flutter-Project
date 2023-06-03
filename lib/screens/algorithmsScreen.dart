import 'package:daaproject/widgets/Algorithms/linearSearch.dart';
import 'package:flutter/material.dart';
import '../widgets/selectMethod.dart';

class MyAlgorithmsScreen extends StatefulWidget {
  const MyAlgorithmsScreen({super.key});

  @override
  State<MyAlgorithmsScreen> createState() => _MyAlgorithmsScreenState();
}

class _MyAlgorithmsScreenState extends State<MyAlgorithmsScreen> {
  bool LinearSearchEnable = false;
  bool BinarySearchEnable = false;
  bool BubbleSortEnable = false;
  bool InsertionSortEnable = false;
  bool SelectionSortEnable = false;

  @override
  Widget build(BuildContext context) {
    final List<int> myArray1 =
        ModalRoute.of(context)?.settings.arguments as List<int>;
    enablerFunction(int a) {
      LinearSearchEnable = false;
      BinarySearchEnable = false;
      BubbleSortEnable = false;
      InsertionSortEnable = false;
      SelectionSortEnable = false;
      if (a == 1)
        Navigator.pushNamed(
          context,
          '/linearsearch',
          arguments: myArray1,
        );
      ;
      if (a == 2)
        Navigator.pushNamed(
          context,
          '/binarysearch',
          arguments: myArray1,
        );
      ;
      if (a == 3) BubbleSortEnable = true;
      if (a == 4) InsertionSortEnable = true;
      if (a == 5) SelectionSortEnable = true;
      setState(() {});
    }

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  MyMethods(enablerFunction),
                ],
              ),
            ),
          ),
        ));
  }
}
