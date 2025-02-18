import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MySlider extends StatefulWidget {
  double sliderValue;
  final Function setsliderValue;
  MySlider(this.sliderValue, this.setsliderValue);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Text("Select Array Size"),
              SfSlider(
                  activeColor: Color.fromARGB(255, 105, 183, 249),
                  showLabels: true,
                  interval: 2,
                  min: 4,
                  max: 20,
                  stepSize: 1,
                  showTicks: true,
                  value: widget.sliderValue,
                  onChanged: (dynamic values) {
                    setState(() {
                      widget.sliderValue = values;
                      widget.setsliderValue(values);
                    });
                  },
                  enableTooltip: false),
            ],
          )),
    );
  }
}
