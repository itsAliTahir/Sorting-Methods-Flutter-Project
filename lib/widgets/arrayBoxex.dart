import 'package:flutter/material.dart';
import '../widgets/array.dart';

class MyArrayBox extends StatefulWidget {
  int sliderValue;
  Function updateValue;
  Function randomValues;
  MyArrayBox(this.sliderValue, this.updateValue, this.randomValues);

  @override
  State<MyArrayBox> createState() => _MyArrayBoxState();
}

class _MyArrayBoxState extends State<MyArrayBox> {
  int selectBox = -2;
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(widget.sliderValue);
    return Column(
      children: [
        Text("Input Values into Array"),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: (MediaQuery.of(context).size.width / 2) -
                  (14.5 * widget.sliderValue)),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.sliderValue,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectBox = index;
                    });
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      color: Color.fromARGB(255, 182, 208, 255),
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
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 12.0),
                                  hintText: ' ',
                                ),
                              )),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.randomValues(1);
                  },
                  child: Text("Reset"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                ),
                ElevatedButton(
                    onPressed: () {
                      widget.randomValues(0);
                    },
                    child: Text("Random Array")),
              ],
            ))
      ],
    );
  }
}
