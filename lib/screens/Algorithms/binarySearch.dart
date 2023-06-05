import 'package:daaproject/widgets/array.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class BinarySearch extends StatefulWidget {
  BinarySearch();
  @override
  State<BinarySearch> createState() => _BinarySearchState();
}

class _BinarySearchState extends State<BinarySearch> {
  int searchValue = -1;
  int pointer = -1;
  int start = -1;
  int end = myArray.length;
  double mid = 0;
  String textBelow = " ";
  Timer mytimer = Timer.periodic(Duration.zero, (timer) {});
  void initState() {
    mytimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final List<int> myArray2 =
        ModalRoute.of(context)?.settings.arguments as List<int>;
    List<int> myArray1;
    myArray1 = List.from(myArray2);
    myArray1.sort();
    binarySearch(Timer mytimerr) {
      mid = (end + start) / 2;
      mid = mid + 0.5;
      pointer = mid.toInt();
      print("$start -- $end");
      if (end - 0.5 == start + 0.5) {
        start = myArray1.length;
        end = -1;
        pointer = -1;
        textBelow = "Couldn't Found Number in This Array";
        mytimerr.cancel();
        setState(() {});
        return;
      }
      if (end - 0.5 != start + 0.5) {
        if (searchValue > myArray1[pointer]) {
          start = pointer;
          textBelow = "Searching...";
          setState(() {});
          return;
        } else if (searchValue < myArray1[pointer]) {
          end = pointer;
          textBelow = "Searching...";
          setState(() {});
          return;
        } else if (searchValue == myArray1[pointer]) {
          // start = pointer;
          // end = pointer;
          textBelow = "Number Found At Location: ${pointer + 1}";
          mytimerr.cancel();
          setState(() {});
          return;
        } else {
          textBelow = "Couldn't Found Number in This Array";
          mytimerr.cancel();
          return;
        }
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
                "Binary Search",
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
                          borderRadius: pointer == index
                              ? BorderRadius.circular(45)
                              : BorderRadius.circular(5),
                          border: Border.all(
                            color: pointer == index
                                ? Colors.black
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        margin: EdgeInsets.all(2),
                        child: Center(
                            child: Text("${myArray1[index]}",
                                style: pointer == index
                                    ? TextStyle(
                                        fontSize: 20, color: Colors.blue)
                                    : index <= start || index >= end
                                        ? TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          )
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
              Container(
                width: 250,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: TextFormField(
                        enabled: !mytimer.isActive,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(fontSize: 15.0),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            searchValue = -1;
                            return;
                          } else if (int.parse(value) > 100 ||
                              int.parse(value) < 0) {
                            return;
                          }
                          searchValue = int.parse(value);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                          hintText: 'Enter Value',
                        ),
                      ),
                    ),
                    mytimer.isActive
                        ? ElevatedButton(onPressed: null, child: Text('Search'))
                        : ElevatedButton(
                            onPressed: () {
                              if (searchValue == -1) return;
                              pointer = -1;
                              start = -1;
                              end = myArray1.length;
                              setState(() {});
                              mytimer =
                                  Timer.periodic(Duration(seconds: 1), (timer) {
                                binarySearch(mytimer);
                              });
                            },
                            child: Text('Search')),
                  ],
                ),
              ),
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