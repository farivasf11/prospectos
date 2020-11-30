import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "Prospectos";
  GradientBack(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final gradient = Container(
      height: 100.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF00ac68),
                Color(0xFF00ac40),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      child: Text(title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            // fontFamily: "Lato",
          )),
      alignment: Alignment(-0.8, .5),
    );
    return gradient;
  }
}
