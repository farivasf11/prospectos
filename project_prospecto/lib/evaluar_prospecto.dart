import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_prospecto/components/button_aprobar.dart';
import 'package:project_prospecto/components/button_rechazar.dart';
import 'components/back_gradient.dart';
import 'components/button_guardar.dart';
import 'components/button_salir.dart';
import 'package:http/http.dart' as http;

class EvaluarProspecto extends StatelessWidget {
  TextEditingController comentariosController = new TextEditingController();

  String id,
      nombre,
      apellidoPaterno,
      apellidoMaterno,
      calle,
      numero,
      colonia,
      codigoPostal,
      rfc,
      telefono,
      correo,
      estado;
  EvaluarProspecto(
      this.id,
      this.nombre,
      this.apellidoPaterno,
      this.apellidoMaterno,
      this.calle,
      this.numero,
      this.colonia,
      this.codigoPostal,
      this.rfc,
      this.telefono,
      this.correo,
      this.estado);
  String nuevoEstado;
  actualizarProspecto() async {
    http.Response response = await http.put(
      "http://10.0.2.2:4000/api/prospectos/$id",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "estado": nuevoEstado,
        "comentarios": comentariosController.text,
      }),
    );
    if (response.statusCode == 200) {
      print("Prospecto actualizado correctamente");
    } else {
      throw Exception('Error al insertar el prospecto');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   isExtended: true,
      //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   icon: Icon(Icons.arrow_back),
      //   label: Text('Volver'),
      //   backgroundColor: Colors.green,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 100.0),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Nombre",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    nombre,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Apellidos",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    apellidoPaterno + " " + apellidoMaterno,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Calle",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    calle + " #" + numero,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Colonia",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    colonia + " C.P." + codigoPostal,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "RFC",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    rfc,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Teléfono",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    telefono,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Correo",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    correo,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Estado",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    estado,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: TextFormField(
                      maxLines: 8,
                      style: TextStyle(fontSize: 20.0),
                      controller: comentariosController,
                      decoration: InputDecoration.collapsed(
                        hintText: "Ingrese sus comentarios",
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              )),
          GradientBack(nombre + " " + apellidoPaterno),
          Positioned(
              bottom: 15,
              right: 15,
              child: Row(
                children: [
                  ButtonAprobar(
                    onPressed: () {
                      nuevoEstado = "Aprobado";
                      actualizarProspecto();
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: ButtonRechazar(
                      onPressed: () {
                        nuevoEstado = "Rechazado";
                        actualizarProspecto();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: ButtonSalir(
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
