import 'dart:convert';
// import 'dart:html';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:project_prospecto/components/back_gradient.dart';
import 'components/load_file.dart';
import 'file_picker.dart';
import 'components/button_guardar.dart';
import 'components/button_salir.dart';

class RegistroProspecto extends StatefulWidget {
  @override
  _RegistroProspectoState createState() => _RegistroProspectoState();
}

class _RegistroProspectoState extends State<RegistroProspecto> {
  final _formKey = GlobalKey<FormState>();

  final fieldText = TextEditingController();

  String _fileName;

  List<PlatformFile> _paths;

  String _directoryPath;

  String _extension;

  bool _multiPick = false;

  FileType _pickingType = FileType.any;

  void _openFileExplorer() async {
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
  }

  void showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Salir"),
      onPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alerta"),
      content:
          Text("¿Desea salir de la aplicación?\nSe perderan todos los cambios"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String nombre,
      apellidoPaterno,
      apellidoMaterno,
      calle,
      numero,
      colonia,
      codigoPostal,
      rfc,
      telefono,
      correo;

  Map documentos = {"Prueba": "Azúl"};

  sendProspecto() async {
    http.Response response = await http.post(
      "http://10.0.2.2:4000/api/prospectos/create",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "nombre": nombre,
        "apellidoPaterno": apellidoPaterno,
        "apellidoMaterno": apellidoMaterno,
        "calle": calle,
        "numero": numero,
        "colonia": colonia,
        "codigoPostal": codigoPostal,
        "rfc": rfc,
        "telefono": telefono,
        "correo": correo,
        "documentos": documentos.toString()
      }),
    );
    if (response.statusCode == 200) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Prospecto enviado correctamente"),
      ));
      print("Prospecto insertado correctamente");
    } else {
      throw Exception('Error al insertar el prospecto');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Container(
                margin: EdgeInsets.only(top: 100.0),
                padding: EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Expanded(child: ListView()),
                      Text(
                        "Datos del prospecto",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w800),
                      ),
                      Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: EdgeInsets.only(
                              top: 0, right: 10.0, bottom: 15.0, left: 10.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blueGrey[100],
                                width: 1,
                              ),
                              shape: BoxShape.rectangle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.blueGrey[50],
                                    offset: Offset(1.0, 1.0))
                              ]),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Nombre',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese un nombre';
                                  }
                                  return null;
                                },
                                onSaved: (input) => nombre = input,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Apellido Paterno',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese apellido paterno';
                                  }
                                  return null;
                                },
                                onSaved: (input) => apellidoPaterno = input,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Apellido Materno',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Por favor ingrese apellido materno';
                                  }
                                  return null;
                                },
                                onSaved: (input) => apellidoMaterno = input,
                              ),
                            ],
                          )),
                      //DATOS DEL DOMICILIO
                      Text(
                        "Domicilio",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w800),
                      ),
                      Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: EdgeInsets.only(
                              top: 0, right: 10.0, bottom: 15.0, left: 10.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blueGrey[100],
                                width: 1,
                              ),
                              shape: BoxShape.rectangle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.blueGrey[50],
                                    offset: Offset(1.0, 1.0))
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 6,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'Calle'),
                                            onSaved: (input) => calle = input,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: 'Número'),
                                              onSaved: (input) =>
                                                  numero = input,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 6,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'Colonia'),
                                            onSaved: (input) => colonia = input,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  hintText: 'CP'),
                                              onSaved: (input) =>
                                                  codigoPostal = input,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'RFC',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Ingrese el RFC';
                                  }
                                  return null;
                                },
                                onSaved: (input) => rfc = input,
                              ),
                            ],
                          )),

                      Text(
                        "Contacto",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w800),
                      ),
                      Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: EdgeInsets.only(
                              top: 0, right: 10.0, bottom: 15.0, left: 10.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blueGrey[100],
                                width: 1,
                              ),
                              shape: BoxShape.rectangle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.blueGrey[50],
                                    offset: Offset(1.0, 1.0))
                              ]),
                          child: Column(children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Teléfono',
                              ),
                              onSaved: (input) => telefono = input,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'E-mail',
                              ),
                              onSaved: (input) => correo = input,
                            ),
                          ])),
                      FilePick(),
                    ],
                  ),
                )),
          ],
        ),
        GradientBack("Registro de Prospecto"),
        Positioned(
            bottom: 15,
            right: 15,
            child: Row(
              children: [
                ButtonGuardar(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _formKey.currentState.reset();
                      print(nombre);
                      sendProspecto();
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: ButtonSalir(
                    onPressed: () {
                      _formKey.currentState.reset();
                      showAlertDialog(context);
                    },
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
