import 'package:daaproject/widgets/array.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:algorithmic/searching.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class LinerarSearch extends StatefulWidget {
  List<int> myArray;
  LinerarSearch(this.myArray);

  @override
  State<LinerarSearch> createState() => _LinerarSearchState();
}

class _LinerarSearchState extends State<LinerarSearch> {
  int searchValue = 1;
  int pointer = -1;
  String textBelow = " ";
  Timer mytimer = Timer.periodic(Duration.zero, (timer) {});
  void initState() {
    mytimer.cancel();
  }

  linearSearch(Timer mytimerr) {
    if (pointer >= 0 &&
        pointer < widget.myArray.length &&
        searchValue == widget.myArray[pointer]) {
      textBelow = "Number Found At Location: ${pointer + 1}";
      mytimerr.cancel();
      setState(() {});
      return;
    } else if (pointer >= widget.myArray.length) {
      textBelow = "Couldn't Found Number in This Array";
      mytimerr.cancel();
      setState(() {});
      return;
    } else if (pointer >= 0 &&
        pointer < widget.myArray.length &&
        searchValue != widget.myArray[pointer]) {
      setState(() {
        pointer++;
        print(pointer);
        textBelow = "Searching...";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                for (int index = 0; index < widget.myArray.length; index++)
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
                      // color: Color.fromARGB(255, 182, 208, 255),
                    ),
                    margin: EdgeInsets.all(2),
                    child: Center(
                        child: Text("${widget.myArray[index]}",
                            style: pointer == index
                                ? TextStyle(fontSize: 20, color: Colors.blue)
                                : pointer > index
                                    ? TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                      )
                                    : TextStyle(
                                        fontSize: 15,
                                      ))),
                  ),
              ],
            ),
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
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(fontSize: 15.0),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        searchValue = -1;
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
                          pointer = -1;
                          pointer++;
                          mytimer =
                              Timer.periodic(Duration(seconds: 1), (timer) {
                            linearSearch(mytimer);
                          });
                          // if (done == true)
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
    );
  }
}
