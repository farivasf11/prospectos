import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonSalir extends StatelessWidget {
  ButtonSalir({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.blueGrey,
      splashColor: Colors.blueGrey[500],
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.logout,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "Salir",
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
