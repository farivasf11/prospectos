import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

import 'components/load_file.dart';

class FilePick extends StatefulWidget {
  @override
  _FilePickerDemoState createState() => _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePick> {
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = true;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
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
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
    print("Prueba de path");
    print(_paths.map((e) => e.name).toList()[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Documentos",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FloatingActionButtonGreen(() {
                        _openFileExplorer();
                      }),
                    ],
                  ),
                ],
              ),
            ),
            Builder(
              builder: (BuildContext context) => _loadingPath
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: const CircularProgressIndicator(),
                    )
                  : _directoryPath != null
                      ? ListTile(
                          title: Text('Directory path'),
                          subtitle: Text(_directoryPath),
                        )
                      : _paths != null
                          ? Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                right: 10,
                                bottom: 10,
                                left: 10,
                              ),
                              padding: EdgeInsets.all(0.0),
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
                              height: MediaQuery.of(context).size.height * 0.20,
                              child: Scrollbar(
                                  child: ListView.separated(
                                itemCount: _paths != null && _paths.isNotEmpty
                                    ? _paths.length
                                    : 1,
                                itemBuilder: (BuildContext context, int index) {
                                  final bool isMultiPath =
                                      _paths != null && _paths.isNotEmpty;
                                  final String name = 'Archivo ${index + 1}: ' +
                                      (isMultiPath
                                          ? _paths
                                              .map((e) => e.name)
                                              .toList()[index]
                                          : _fileName ?? '...');
                                  final path = _paths
                                      .map((e) => e.path)
                                      .toList()[index]
                                      .toString();

                                  return ListTile(
                                    title: Text(
                                      name,
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
                              )),
                            )
                          : const SizedBox(),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    ));
  }
}
