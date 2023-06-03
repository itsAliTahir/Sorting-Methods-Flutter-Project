import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class MyMethods extends StatefulWidget {
  Function MethodsFun;

  MyMethods(this.MethodsFun);

  @override
  State<MyMethods> createState() => _MyMethodsState();
}

class _MyMethodsState extends State<MyMethods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              child: const Text("Select Method")),
          Container(
              width: 170,
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {
                    widget.MethodsFun(1);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search),
                      const Text("Linear Search"),
                    ],
                  ))),
          Container(
              width: 170,
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {
                    widget.MethodsFun(2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search),
                      const Text("Binary Search"),
                    ],
                  ))),
          Container(
              width: 170,
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.sort_rounded),
                      const Text("Bubble Sort"),
                    ],
                  ))),
          Container(
              width: 170,
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.sort_rounded),
                      const Text("Selection Sort"),
                    ],
                  ))),
          Container(
              width: 170,
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.sort_rounded),
                      const Text("Insertion Sort"),
                    ],
                  ))),
        ],
      ),
    );
  }
}
