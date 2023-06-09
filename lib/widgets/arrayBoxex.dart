import 'package:flutter/material.dart';
import '../widgets/array.dart';

class MyArrayBox extends StatefulWidget {
  int sliderValue;
  Function updateValue;
  Function randomValues;
  Function tempArrayFun;
  bool displayError;
  int screen;
  MyArrayBox(this.sliderValue, this.updateValue, this.randomValues,
      this.tempArrayFun, this.displayError, this.screen);

  @override
  State<MyArrayBox> createState() => _MyArrayBoxState();
}

class _MyArrayBoxState extends State<MyArrayBox> {
  int selectBox = -2;
  @override
  Widget build(BuildContext context) {
    print('${widget.displayError}');
    // print(MediaQuery.of(context).size.width);
    // print(widget.sliderValue);
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7,
                ),
                Text("Generated Array"),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    borderOnForeground: true,
                    color: Colors.white,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        for (int index = 0; index < widget.sliderValue; index++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectBox = index;
                              });
                            },
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                // color: Color.fromARGB(255, 182, 208, 255),
                              ),
                              margin: EdgeInsets.all(2),
                              child: Center(
                                  child: selectBox != index
                                      ? Text(
                                          "${myArray[index].value}",
                                          style: TextStyle(fontSize: 15),
                                        )
                                      : TextFormField(
                                          style: TextStyle(fontSize: 15.0),
                                          onChanged: (value) {
                                            widget.updateValue(index.toInt(),
                                                int.parse(value));
                                          },
                                          onTapOutside: (event) {
                                            selectBox = -2;
                                            setState(() {});
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 12.0),
                                            hintText: ' ',
                                          ),
                                        )),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                widget.displayError == true && widget.screen > 0
                    ? Text(
                        'Please Input Values Into Your Array',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        ' ',
                      ),
              ],
            ),
            // SizedBox(
            //   height: 190,
            // ),
            Container(
                // color: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: [
                    Ink(
                      width: 80,
                      height: 45,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        splashColor: Color.fromARGB(255, 121, 121, 121),
                        onTap: () {
                          widget.randomValues(1);
                        },
                        child: Center(
                          child: Text(
                            "Reset",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Ink(
                      width: 130,
                      height: 45,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 105, 183, 249),
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        splashColor: Colors.blue,
                        splashFactory: InkRipple.splashFactory,
                        onTap: () {
                          widget.randomValues(0);
                        },
                        child: Center(
                          child: Text(
                            "Random Array",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Ink(
                      width: 130,
                      height: 45,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 105, 183, 249),
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          widget.tempArrayFun(1);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Algorithms",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
