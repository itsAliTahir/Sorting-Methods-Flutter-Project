import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class MyMethods extends StatelessWidget {
  const MyMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: Text("Select Sorting Methods")),
        Container(
            padding: EdgeInsets.all(10),
            child:
                ElevatedButton(onPressed: () {}, child: Text("Bubble Sort"))),
        Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {}, child: Text("Selection Sort"))),
        Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {}, child: Text("Insertion Sort"))),
        Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(onPressed: () {}, child: Text("Merge Sort"))),
        Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(onPressed: () {}, child: Text("Quick Sort"))),
      ],
    );
  }
}
