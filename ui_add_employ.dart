import 'package:calciumcarbonatecompany/company_repository.dart';
import 'package:calciumcarbonatecompany/data/db_employ.dart';
import 'package:calciumcarbonatecompany/ui/ui_worker_list_page.dart';
import 'package:flutter/material.dart';

class AddEmploy extends StatefulWidget {
  @override
  _AddEmployState createState() => _AddEmployState();
}

class _AddEmployState extends State<AddEmploy> {
  final workerListPage = WorkerListPage();
  final _repository = CompanyRepository();
  var nameController = TextEditingController();
  var fatherController = TextEditingController();
  var motherController = TextEditingController();
  var teshController = TextEditingController();

  Future<void> addWorker() async {
    try {
      var id = DateTime.now().microsecondsSinceEpoch.toString();
      var nameEmploy = nameController.text;
      var father = fatherController.text;
      var mother = motherController.text;
      var tesh = teshController.text;

      await _repository.addMember(
        Employ(
          fathername: father,
          id: id,
          names: nameEmploy,
          motherName: mother,
          tesh: tesh,
        ),
      );
      print(father);
      print(nameEmploy);
    } catch (e) {
      print(e);
      print('Something Went Wrong');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Worker'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 3,
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: nameController,
                  // validator: (String name) {
                  // var workerName = name.trim();
                  // if (workerName == ' ') {
                  //   return "please enter something";
                  // } else {
                  //   return null;
                  // }
                  // },
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff0e9447),
                      ),
                    ),
                    hintText: 'Enter Name',
                    labelText: 'NAME',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                // child: TextFormField(
                //   controller: motherController,
                //   // autovalidate: false,
                //   // validator: (String name) {
                //   // var fatherName = name.trim();
                //   // },
                //   autofocus: true,
                //   decoration: InputDecoration(
                //     enabledBorder: const OutlineInputBorder(
                //       borderSide: const BorderSide(
                //         color: Color(0xff0e9447),
                //       ),
                //     ),
                //     hintText: 'Enter FatherName',
                //     labelText: 'MotherName',
                //
                //     // hintStyle: TextStyle(
                //     //   fontSize: (30),
                //   ),
                // ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: fatherController,
                  // autovalidate: false,
                  // validator: (String name) {
                  // var fatherName = name.trim();
                  // },
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff0e9447),
                      ),
                    ),
                    hintText: 'Enter FatherName',
                    labelText: 'FATHERNAME',

                    // hintStyle: TextStyle(
                    //   fontSize: (30),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                // child: TextFormField(
                //   controller: teshController,
                //   // autovalidate: false,
                //   // validator: (String name) {
                //   // var fatherName = name.trim();
                //   // },
                //   autofocus: true,
                //   decoration: InputDecoration(
                //     enabledBorder: const OutlineInputBorder(
                //       borderSide: const BorderSide(
                //         color: Color(0xff0e9447),
                //       ),
                //     ),
                //     hintText: 'Enter Tesh Name',
                //     labelText: 'TESH',
                //
                //     // hintStyle: TextStyle(
                //     //   fontSize: (30),
                //   ),
                // ),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          RaisedButton(
            onPressed: () {
              addWorker();
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
