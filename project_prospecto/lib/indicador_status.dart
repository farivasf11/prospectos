import 'package:flutter/material.dart';

class IndStat extends StatefulWidget {
  @override
  String estado;
  IndStat(this.estado);
  _IndStat createState() => _IndStat(estado);
}

class _IndStat extends State<IndStat> {
  String estado;

  _IndStat(this.estado);

  List<Color> colorEstatus = [
    Color(0xFF4268D3),
    Color(0xFF584CD1),
  ];
  List<Color> colorAprobado = [
    Color(0xFF018126),
    Color(0xFF018e4f),
  ];
  List<Color> colorRechazado = [
    Color(0xFFbf1a2f),
    Color(0xFFbf1a25),
  ];

  void SelectColor() {
    switch (this.estado) {
      case "Aprobado":
        colorEstatus = colorAprobado;
        break;
      case "Rechazado":
        colorEstatus = colorRechazado;
        break;
      default:
    }
  }

  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    SelectColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115.0,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
              colors: colorEstatus,
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      child: Text(estado,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
