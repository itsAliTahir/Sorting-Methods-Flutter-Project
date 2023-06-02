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
  bool menu = true;
  LinearSearch() {
    print(213);
    menu = false;
    LinearSearchEnable = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<int> myArray =
        ModalRoute.of(context)?.settings.arguments as List<int>;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  if (menu == true) MyMethods(LinearSearch),
                  if (LinearSearchEnable == true) LinerarSearch(myArray),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: menu == false
            ? FloatingActionButton.extended(
                onPressed: () {
                  LinearSearchEnable = false;
                  menu = true;
                  setState(() {});
                },
                label: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    Text("Back"),
                  ],
                ))
            : null);
  }
}
