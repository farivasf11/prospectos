import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

  VoidCallback onPressCustom;
  FloatingActionButtonGreen(this.onPressCustom);
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Añadir",
      onPressed: () {
        widget.onPressCustom();
      },
      child: Icon(Icons.add),
    );
  }
}
