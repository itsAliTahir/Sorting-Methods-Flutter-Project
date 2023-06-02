
import 'package:flutter/material.dart';

class BubbleSortScreen extends StatefulWidget {
  const BubbleSortScreen({super.key});

  @override
  State<BubbleSortScreen> createState() => _BubbleSortScreenState();
}

class _BubbleSortScreenState extends State<BubbleSortScreen> {
  List<int> array = [2, 3, 1, 5, 8, 6];
  bool arraySorted = false;
  int temp = 0;
  int i = -1;
  int j = 0;
  void bubbleSorting() {
    if (i < 6 && j < 5) {
      i++;
      j++;
    }
    print(j);
    if (array[i] > array[j]) {
      temp = array[i];
      array[i] = array[j];
      array[j] = temp;
      print("Sorted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Bubble Sort Algorithm"),
          Column(
            children: [
              // for (int o = 0; o < 6; o++)
              Container(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: array.length,
                  itemBuilder: (context, index) {
                    bubbleSorting();
                    return Container(
                        width: 30,
                        height: 30,
                        decoration: index != j && index != i
                            ? BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                color: Color.fromARGB(255, 182, 208, 255),
                              )
                            : BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 243, 128, 33),
                                    width: 2),
                                color: Color.fromARGB(255, 255, 226, 182),
                              ),
                        margin: EdgeInsets.all(2),
                        child: Center(
                            child: Text(
                          "${array[index]}",
                          style: TextStyle(fontSize: 15),
                        )));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
