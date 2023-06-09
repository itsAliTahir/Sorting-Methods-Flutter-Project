import 'package:flutter/material.dart';

class MyMethods extends StatefulWidget {
  Function MethodsFun;

  MyMethods(this.MethodsFun);

  @override
  State<MyMethods> createState() => _MyMethodsState();
}

class _MyMethodsState extends State<MyMethods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              widget.MethodsFun(1);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 45),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 105, 183, 249)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.linear_scale_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Linear Search",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "Sequentially checking each\nelement until a match is found.",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.black)),
                    child: Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              widget.MethodsFun(2);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 45),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 0, 200, 173)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.safety_divider),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Binary Search",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "Dividing and conquering a sorted\nlist to find the target element.",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.black)),
                    child: Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              widget.MethodsFun(3);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 45),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 147, 170, 214)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.bubble_chart),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bubble Sort",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "Repeatedly swapping adjacent\nelements to sort the list.",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.black)),
                    child: Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              widget.MethodsFun(4);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 45),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 105, 183, 249)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.highlight_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Selection Sort",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "Sort by selecting and swapping\nthe smallest element.",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.black)),
                    child: Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              widget.MethodsFun(5);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 45),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 0, 200, 173)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.bar_chart),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Insertion Sort",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "Sorting by iteratively inserting\nelements in their correct place.",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.black)),
                    child: Icon(
                      Icons.navigate_next_sharp,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
