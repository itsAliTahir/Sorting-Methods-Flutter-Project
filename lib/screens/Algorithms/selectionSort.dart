import 'package:daaproject/widgets/array.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Ray {
  int value;
  Ray(this.value);
}

List<Ray> myArray1 = [];

class SelectionSort extends StatefulWidget {
  SelectionSort();
  @override
  State<SelectionSort> createState() => _SelectionSortState();
}

class _SelectionSortState extends State<SelectionSort> {
  int pointer1 = -1;
  int pointer2 = -1;
  int temp = 0;
  int min = -1;
  bool sorted = true;
  String textBelow = " ";
  Timer mytimer = Timer.periodic(Duration.zero, (timer) {});

  void initState() {
    mytimer.cancel();
    myArray1 = [];
    for (int i = 0; i < mainSlider; i++) {
      Ray newRay = Ray(myArray[i].value);
      myArray1.add(newRay);
    }
    min = -1;
  }

  @override
  Widget build(BuildContext context) {
    final List<int> myArray2 =
        ModalRoute.of(context)?.settings.arguments as List<int>;
    List<int> myArray3;
    myArray3 = List.from(myArray2);
    myArray3.sort();

    bubbleSortFun(Timer mytimer1) {
      if (myArray1.length > pointer2) {
        print('${min} - ${pointer2} - ${pointer1}');
        if (myArray1[min].value > myArray1[pointer2].value) {
          print("swaped");
          sorted = true;
          min = pointer2;
          pointer2++;
          setState(() {});
        } else {
          print("continue");
          textBelow = "Progressing...";
          sorted = true;
          pointer2++;
          setState(() {});
        }
      } else {
        print("reached end");
        temp = myArray1[pointer1].value;
        myArray1[pointer1].value = myArray1[min].value;
        myArray1[min].value = temp;
        textBelow = "Swaped With Minimum Value";
        for (int i = 0; i < mainSlider; i++) {
          if (myArray1[i].value != myArray3[i]) sorted = false;
          print('${myArray1[i].value} -- ${myArray3[i]}');
        }
        if (sorted == true) {
          pointer1 = myArray1.length;
          pointer2 = -1;
          textBelow = "Array Sorted";
          min = -1;
          mytimer.cancel();
        } else {
          pointer1++;
          min = pointer1;
          pointer2 = pointer1;
        }

        setState(() {});
      }
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                "Selection Sort",
                style: TextStyle(
                    color: Color.fromARGB(255, 124, 123, 123), fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Wrap(
                  children: [
                    for (int index = 0; index < myArray1.length; index++)
                      AnimatedContainer(
                        duration: Duration(
                          seconds: 1,
                        ),
                        curve: Curves.fastOutSlowIn,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: pointer1 == index || pointer2 == index
                              ? BorderRadius.circular(45)
                              : BorderRadius.circular(5),
                          border: Border.all(
                            color: (pointer1 == index) &&
                                    textBelow == "Swaped With Minimum Value"
                                ? Colors.red
                                : (pointer1 == index || pointer2 == index)
                                    ? Colors.black
                                    : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        margin: EdgeInsets.all(2),
                        child: Center(
                            child: Text("${myArray1[index].value}",
                                style: (pointer1 == index || pointer2 == index)
                                    ? TextStyle(
                                        fontSize: 20, color: Colors.blue)
                                    : pointer1 > index
                                        ? TextStyle(
                                            fontSize: 15,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)
                                        : min == index
                                            ? TextStyle(
                                                fontSize: 15,
                                                color: Colors.orangeAccent,
                                                fontWeight: FontWeight.bold)
                                            : TextStyle(
                                                fontSize: 15,
                                              ))),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              textBelow == "Array Sorted"
                  ? InkWell(
                      splashColor: Colors.blue,
                      onTap: () {
                        mytimer.cancel();
                        textBelow = " ";
                        myArray1 = [];
                        for (int i = 0; i < mainSlider; i++) {
                          Ray newRay = Ray(myArray[i].value);
                          myArray1.add(newRay);
                        }
                        pointer1 = -1;
                        pointer2 = -1;
                        min = -1;
                        setState(() {});
                      },
                      child: Ink(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 105, 183, 249),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Reset',
                        ),
                      ))
                  : mytimer.isActive
                      ? InkWell(
                          splashColor: Colors.blue,
                          onTap: () {
                            mytimer.cancel();
                            textBelow = "Cancelled";
                            myArray1 = [];
                            for (int i = 0; i < mainSlider; i++) {
                              Ray newRay = Ray(myArray[i].value);
                              myArray1.add(newRay);
                            }
                            pointer1 = -1;
                            pointer2 = -1;
                            min = -1;
                            setState(() {});
                          },
                          child: Ink(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 105, 183, 249),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Cancel',
                            ),
                          ))
                      : InkWell(
                          splashColor: Colors.blue,
                          onTap: () {
                            pointer1 = 0;
                            pointer2 = 1;
                            min = 0;
                            setState(() {});
                            mytimer = Timer.periodic(
                                Duration(milliseconds: 750), (timer) {
                              bubbleSortFun(mytimer);
                            });
                          },
                          child: Ink(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 105, 183, 249),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('Sort'))),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  width: double.infinity,
                  height: 20,
                  child: Center(child: Text(textBelow))),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: mytimer.isActive
            ? FloatingActionButton.extended(
                backgroundColor: Color.fromARGB(255, 226, 226, 226),
                onPressed: () {},
                label: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_sharp,
                        color: Color.fromARGB(255, 143, 143, 143)),
                    SizedBox(width: 2),
                    Text(
                      'Back',
                      style:
                          TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
                    )
                  ],
                ))
            : FloatingActionButton.extended(
                backgroundColor: Color.fromARGB(255, 105, 183, 249),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2),
                    Text(
                      'Back',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
      ),
    );
  }
}
