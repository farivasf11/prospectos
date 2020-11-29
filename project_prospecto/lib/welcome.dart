import 'package:flutter/material.dart';
import 'package:project_prospecto/navigation_prospectos.dart';
import 'package:project_prospecto/prospectos_evaluar.dart';
import 'components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Center(
        child: Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Prospectos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
            SizedBox(height: size.height * 0.05),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Promotor",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationProspectos(),
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Evaluación",
              color: Colors.blue,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProspectosEvaluar(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
