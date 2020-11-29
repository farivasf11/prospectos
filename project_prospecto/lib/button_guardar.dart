import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonGuardar extends StatelessWidget {
  ButtonGuardar({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF11DA53),
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.save,
              color: Colors.blueGrey,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "Guardar",
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
