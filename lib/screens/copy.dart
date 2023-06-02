import 'package:flutter/material.dart';

class LinerarSearch extends StatefulWidget {
  const LinerarSearch({super.key});

  @override
  State<LinerarSearch> createState() => _LinerarSearchState();
}

class _LinerarSearchState extends State<LinerarSearch> {
  List<int> tempArray = [5, 9, 6, 2, 8, 7, 3, 1, 6];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Wrap(
        children: [
          for (int index = 0; index < tempArray.length; index++)
            Container(
              width: 50,
              height: 50,
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
                  child: Text(
                "${tempArray[index]}",
                style: TextStyle(fontSize: 15),
              )),
            ),
        ],
      ),
    );
  }
}
