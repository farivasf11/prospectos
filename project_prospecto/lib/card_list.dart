import 'package:flutter/material.dart';
import 'indicador_status.dart';

class CardList extends StatelessWidget {
  String nombre, apellido, estado;
  CardList(this.nombre, this.apellido, this.estado);
  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                apellido,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ],
      ),
    );

    return Stack(
      alignment: Alignment(.90, 0),
      children: [card, IndStat(estado)],
    );
  }
}
