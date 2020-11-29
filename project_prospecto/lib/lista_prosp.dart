import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_prospecto/card_prospecto.dart';
import 'back_gradient.dart';
import 'card_prospecto.dart';
import 'card_list.dart';

class ListaProspectosStaFul extends StatefulWidget {
  @override
  @override
  State<StatefulWidget> createState() {
    return _ListaProspectosStaFul();
  }
}

class _ListaProspectosStaFul extends State<ListaProspectosStaFul> {
  Map data;
  List usersData;

  getUsers() async {
    http.Response response =
        await http.get('http://10.0.2.2:4000/api/prospectos');
    data = json.decode(response.body);
    setState(() {
      usersData = data['prosp'];
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 100.0),
          child: ListView.builder(
            itemCount: usersData == null ? 0 : usersData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: InkWell(
                onTap: () {
                  print("Pulsado ${usersData[index]["nombre"]}");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardProspecto(
                              usersData[index]["nombre"],
                              usersData[index]["apellidoPaterno"],
                              usersData[index]["apellidoMaterno"],
                              usersData[index]["calle"],
                              usersData[index]["numero"],
                              usersData[index]["colonia"],
                              usersData[index]["codigoPostal"].toString(),
                              usersData[index]["rfc"],
                              usersData[index]["telefono"].toString(),
                              usersData[index]["correo"],
                              usersData[index]["estado"])));
                },
                child: CardList(
                    usersData[index]["nombre"],
                    usersData[index]["apellidoPaterno"] +
                        " " +
                        usersData[index]["apellidoMaterno"],
                    usersData[index]["estado"]),
              ));
            },
          ),
        ),
        GradientBack("Lista de prospectos")
      ],
    ));
  }
}
