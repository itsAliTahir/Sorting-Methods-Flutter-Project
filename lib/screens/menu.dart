import 'package:flutter/material.dart';
import '../widgets/slider.dart';
import '../widgets/arrayBoxex.dart';
import '../widgets/array.dart';
import 'dart:math';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  late double sliderValue = 6;
  bool emptyArray = true;
  int screen = 0;
  List<int> tempArray = [];
  void setSliderValue(double i) {
    sliderValue = i;
    setState(() {});
  }

  void randomValues(int a) {
    int minValue = 4;
    int maxValue = 20;
    screen++;
    emptyArray = true;
    if (a == 0) {
      Random random = Random();
      sliderValue =
          (minValue + random.nextInt(maxValue - minValue + 1)).toDouble();
    }
    for (int i = 0; i < 20; i++) {
      if (a == 0) {
        minValue = 1;
        maxValue = 99;
        emptyArray = false;
        Random random = Random();
        myArray[i].value = minValue + random.nextInt(maxValue - minValue + 1);
        setState(() {});
      } else {
        screen = 0;
        tempArray = [];
        emptyArray = true;
        myArray[i].value = 0;
        sliderValue = 6;
        setState(() {});
      }
    }
  }

  void UpdateArrayValue(int index, int val) {
    myArray[index].value = val;
    emptyArray = false;
    screen++;
    setState(() {});
  }

  void tempArrayFun(int a) {
    if (a == 1) {
      tempArray = [];
      mainSlider = sliderValue.toInt();
      for (int i = 0; i < sliderValue; i++) {
        if (myArray[i].value != 0) {
          emptyArray = false;
        }
      }
      if (emptyArray == false) {
        for (int i = 0; i < sliderValue; i++) {
          tempArray.add(myArray[i].value);
          print(tempArray[i]);
        }
        Navigator.pushNamed(
          context,
          '/algorithmsscreen',
          arguments: tempArray,
        );
      } else {
        screen = 1;
        print(emptyArray);
        print(screen);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Generate Array",
          style: TextStyle(color: Color.fromARGB(255, 47, 47, 47)),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 60,
            child: Column(
              children: [
                MySlider(sliderValue, setSliderValue),
                MyArrayBox(sliderValue.toInt(), UpdateArrayValue, randomValues,
                    tempArrayFun, emptyArray, screen),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
