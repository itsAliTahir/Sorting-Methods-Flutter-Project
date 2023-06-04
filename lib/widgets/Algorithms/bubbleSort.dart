// import 'package:daaproject/widgets/array.dart';
import 'package:daaproject/widgets/array.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
// import '../../widgets/array.dart';

class Ray {
  int value;
  Ray(this.value);
}

List<Ray> myArray1 = [];

class BubbleSort extends StatefulWidget {
  BubbleSort();
  @override
  State<BubbleSort> createState() => _BubbleSortState();
}

class _BubbleSortState extends State<BubbleSort> {
  int pointer1 = -1;
  int pointer2 = -1;
  int temp = 0;
  bool sorted = true;
  String textBelow = " ";
  Timer mytimer = Timer.periodic(Duration.zero, (timer) {});
  Timer mytimer3 = Timer.periodic(Duration.zero, (timer) {});

  void initState() {
    mytimer.cancel();
    mytimer3.cancel();
    myArray1 = [];
    for (int i = 0; i < mainSlider; i++) {
      Ray newRay = Ray(myArray[i].value);
      myArray1.add(newRay);
    }
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
        if (myArray1[pointer1].value > myArray1[pointer2].value) {
          print("swaped");
          sorted = true;
          textBelow = "Values Swaped";
          setState(() {
            temp = myArray1[pointer1].value;
            myArray1[pointer1].value = myArray1[pointer2].value;
            myArray1[pointer2].value = temp;
          });
        } else {
          print("continue");
          textBelow = "Progressing...";
          sorted = true;
          pointer1++;
          pointer2++;
          setState(() {});
        }
      } else {
        print("reached end");

        for (int i = 0; i < mainSlider; i++) {
          if (myArray1[i].value != myArray3[i]) sorted = false;
          print('${myArray1[i].value} -- ${myArray3[i]}');
        }
        if (sorted == true) {
          pointer1 = -1;
          pointer2 = -1;
          textBelow = "Array Sorted";
          mytimer.cancel();
        } else {
          pointer1 = 0;
          pointer2 = 1;
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
                "Bubble Sort",
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
                            color: (pointer1 == index || pointer2 == index) &&
                                    textBelow == "Values Swaped"
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
                                style: pointer1 == index || pointer2 == index
                                    ? TextStyle(
                                        fontSize: 20, color: Colors.blue)
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
              mytimer.isActive || textBelow == "Array Sorted"
                  ? ElevatedButton(onPressed: null, child: Text('Sort'))
                  : ElevatedButton(
                      onPressed: () {
                        pointer1 = 0;
                        pointer2 = 1;
                        setState(() {});
                        mytimer = Timer.periodic(Duration(seconds: 1), (timer) {
                          bubbleSortFun(mytimer);
                        });
                      },
                      child: Text('Sort')),
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_sharp),
                    SizedBox(width: 2),
                    Text('Back')
                  ],
                )),
      ),
    );
  }
}
