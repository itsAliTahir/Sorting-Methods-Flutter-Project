import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class LinearSearch extends StatefulWidget {
  LinearSearch();
  @override
  State<LinearSearch> createState() => _LinearSearchState();
}

class _LinearSearchState extends State<LinearSearch> {
  int searchValue = -1;
  int pointer = -1;
  String textBelow = " ";
  Timer mytimer = Timer.periodic(Duration.zero, (timer) {});
  void initState() {
    mytimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final List<int> myArray =
        ModalRoute.of(context)?.settings.arguments as List<int>;
    linearSearch(Timer mytimerr) {
      if (pointer >= 0 &&
          pointer < myArray.length &&
          searchValue == myArray[pointer]) {
        textBelow = "Number Found At Index: $pointer";
        mytimerr.cancel();
        setState(() {});
        return;
      } else if (pointer >= myArray.length) {
        textBelow = "Couldn't Found Number in This Array";
        mytimerr.cancel();
        setState(() {});
        return;
      } else if (pointer >= 0 &&
          pointer < myArray.length &&
          searchValue != myArray[pointer]) {
        setState(() {
          pointer++;
          textBelow = "Searching...";
        });
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
                "Linear Search",
                style: TextStyle(
                    color: Color.fromARGB(255, 124, 123, 123), fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Wrap(
                  children: [
                    for (int index = 0; index < myArray.length; index++)
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
                            child: Text("${myArray[index]}",
                                style: pointer == index
                                    ? TextStyle(
                                        fontSize: 20, color: Colors.blue)
                                    : pointer > index
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
                              pointer++;
                              setState(() {});
                              mytimer = Timer.periodic(
                                  Duration(milliseconds: 750), (timer) {
                                linearSearch(mytimer);
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
