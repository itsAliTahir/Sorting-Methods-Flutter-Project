import 'package:flutter/material.dart';
import '../widgets/slider.dart';
import '../widgets/arrayBoxex.dart';
import '../widgets/array.dart';
import '../widgets/selectMethod.dart';
import 'dart:math';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  late double sliderValue = 6;
  List<int> tempArray = [];
  void setSliderValue(double i) {
    sliderValue = i;
    setState(() {});
  }

  void randomValues(int a) {
    int minValue = 4;
    int maxValue = 20;
    if (a == 0) {
      Random random = Random();
      sliderValue =
          (minValue + random.nextInt(maxValue - minValue + 1)).toDouble();
    }
    for (int i = 0; i < 20; i++) {
      if (a == 0) {
        minValue = 1;
        maxValue = 99;
        Random random = Random();
        myArray[i].value = minValue + random.nextInt(maxValue - minValue + 1);
        setState(() {});
      } else {
        myArray[i].value = 0;
        sliderValue = 6;
        setState(() {});
      }
    }
  }

  void UpdateArrayValue(int index, int val) {
    myArray[index].value = val;
  }

  void tempArrayFun(int a) {
    if (a == 1) {
      tempArray = [];
      mainSlider = sliderValue.toInt();
      for (int i = 0; i < sliderValue; i++) {
        tempArray.add(myArray[i].value);
        print(tempArray[i]);
      }
      Navigator.pushNamed(
        context,
        '/algorithmsscreen',
        arguments: tempArray,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MySlider(sliderValue, setSliderValue),
              MyArrayBox(sliderValue.toInt(), UpdateArrayValue, randomValues,
                  tempArrayFun),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
