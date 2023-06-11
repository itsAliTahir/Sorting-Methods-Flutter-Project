import 'package:daaproject/screens/Algorithms/linearSearch.dart';
import 'package:flutter/material.dart';
import '../widgets/selectMethod.dart';

class MyAlgorithmsScreen extends StatefulWidget {
  const MyAlgorithmsScreen({super.key});

  @override
  State<MyAlgorithmsScreen> createState() => _MyAlgorithmsScreenState();
}

class _MyAlgorithmsScreenState extends State<MyAlgorithmsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<int> myArray1 =
        ModalRoute.of(context)?.settings.arguments as List<int>;
    enablerFunction(int a) {
      if (a == 1)
        Navigator.pushNamed(
          context,
          '/linearsearch',
          arguments: myArray1,
        );
      if (a == 2)
        Navigator.pushNamed(
          context,
          '/binarysearch',
          arguments: myArray1,
        );
      if (a == 3)
        Navigator.pushNamed(
          context,
          '/bubblesort',
          arguments: myArray1,
        );
      if (a == 4)
        Navigator.pushNamed(
          context,
          '/selectionsort',
          arguments: myArray1,
        );
      if (a == 5)
        Navigator.pushNamed(
          context,
          '/insertionsort',
          arguments: myArray1,
        );
      setState(() {});
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Algorithms",
            style: TextStyle(color: Color.fromARGB(255, 47, 47, 47)),
          ),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: SingleChildScrollView(
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
