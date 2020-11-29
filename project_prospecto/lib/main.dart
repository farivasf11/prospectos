import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:project_prospecto/lista_prosp.dart';
import 'package:project_prospecto/navigation_prospectos.dart';
import 'package:project_prospecto/seleccion_usuario.dart';
import 'dart:convert';
import 'lista_prosp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    // MaterialApp(home: NavigationProspectos()),
    MaterialApp(home: SeleccionUsuario()),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // ListaProspectos(usersData),
        ListaProspectosStaFul()
        //RegistroProspecto()
      ],
    ));
  }
}
