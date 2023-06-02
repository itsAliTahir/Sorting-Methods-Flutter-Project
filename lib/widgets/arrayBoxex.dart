import 'package:flutter/material.dart';
import '../widgets/array.dart';

class MyArrayBox extends StatefulWidget {
  int sliderValue;
  Function updateValue;
  Function randomValues;
  Function tempArrayFun;
  MyArrayBox(
      this.sliderValue, this.updateValue, this.randomValues, this.tempArrayFun);

  @override
  State<MyArrayBox> createState() => _MyArrayBoxState();
}

class _MyArrayBoxState extends State<MyArrayBox> {
  int selectBox = -2;
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(widget.sliderValue);
    return Container(
      height: MediaQuery.of(context).size.height - 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Input Values into Array"),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 250,
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
                                        widget.updateValue(
                                            index.toInt(), int.parse(value));
                                      },
                                      onTapOutside: (event) {
                                        selectBox = -2;
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        hintText: ' ',
                                      ),
                                    )),
                        ),
                      ),
                  ],
                ),
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
                spacing: 15,
                runSpacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.randomValues(1);
                    },
                    child: Text("Reset"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        widget.randomValues(0);
                      },
                      child: Text("Random Array")),
                  Container(
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.tempArrayFun(1);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Algorithms"),
                          Icon(Icons.navigate_next)
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
