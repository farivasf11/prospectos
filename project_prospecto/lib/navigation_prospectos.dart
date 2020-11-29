import 'package:flutter/material.dart';
import 'package:project_prospecto/lista_prosp.dart';
import 'lista_prosp.dart';
import 'package:project_prospecto/registro_prospecto.dart';

class NavigationProspectos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationProspectos();
  }
}

class _NavigationProspectos extends State<NavigationProspectos> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    RegistroProspecto(),
    ListaProspectosStaFul()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white, primaryColor: Colors.green[900]),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.create), label: "Registrar"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Listado")
          ],
        ),
      ),
    );
  }
}
