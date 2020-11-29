import 'package:flutter/material.dart';
import 'back_gradient.dart';

class CardProspecto extends StatelessWidget {
  String nombre,
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
  CardProspecto(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        isExtended: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        icon: Icon(Icons.arrow_back),
        label: Text('Volver'),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  )
                ],
              )),
          GradientBack(nombre + " " + apellidoPaterno)
        ],
      ),
    );
  }
}
