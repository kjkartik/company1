import 'package:calciumcarbonatecompany/data/db_employ.dart';
import 'package:flutter/material.dart';

import '../company_repository.dart';

class EditEmploy extends StatefulWidget {
  final Employ getWorkerData;

  const EditEmploy({
    Key key,
    this.getWorkerData,
  }) : super(key: key);

  @override
  _EditEmployState createState() => _EditEmployState(getWorkerData);
}

class _EditEmployState extends State<EditEmploy> {
  final _repository = CompanyRepository();

  final Employ worker;
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var fatherController = TextEditingController();
  var motherController = TextEditingController();

  _EditEmployState(this.worker);
  @override
  void initState() {
    super.initState();
    setState(() {
      motherController.text = widget.getWorkerData.motherName;
      nameController.text = widget.getWorkerData.names;
      fatherController.text = widget.getWorkerData.fathername;
      idController.text = widget.getWorkerData.id;
    });
  }

  Future<void> editMember() async {
    try {
      var name = nameController.text;
      var id = idController.text;
      var father = fatherController.text;
      var mother = motherController.text;
      _repository.updateMember(Employ(
        id: id,
        motherName: mother,
        names: name,
        fathername: father,
      ));
    } catch (e) {
      print(e);
      print('Some Went Wrong');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff0e9447),
                    ),
                  ),
                  labelText: "ID",
                ),
                controller: nameController,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff0e9447),
                    ),
                  ),
                  labelText: "Name",
                ),
                controller: idController,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff0e9447),
                      ),
                    ),
                    labelText: "FatherName"),
                controller: fatherController,
              ),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff0e9447),
                      ),
                    ),
                    labelText: "FatherName"),
                controller: motherController,
              ),
            ),
            RaisedButton(
              onPressed: () {
                editMember();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
