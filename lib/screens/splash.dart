import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'menu.dart';

class MySplash extends StatefulWidget {
  const MySplash();

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override

  // GifController _controller;

  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 10000)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => MyMenu()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
            child: AnimatedContainer(
          duration: Duration(milliseconds: 1),
          curve: Curves.bounceOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Algorithms\n Visualizer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/loading.gif',
                scale: 5,
              )
            ],
          ),
        )),
      ),
    );
  }
}
