import 'package:calciumcarbonatecompany/data/db_employ.dart';
import 'package:calciumcarbonatecompany/ui/ui_edit_employ.dart';
import 'package:flutter/material.dart';

import '../company_repository.dart';

class WorkerDetailPage extends StatefulWidget {
  @override
  _WorkerDetailPageState createState() => _WorkerDetailPageState();
}

class _WorkerDetailPageState extends State<WorkerDetailPage> {
  final employ = Employ();
  final _repository = CompanyRepository();
  List<Employ> workerList;
  bool _loading;

  // class _loadData

  Future<void> _loadData() async {
    var employList = await _repository.getCompanyList();
    setState(() {
      workerList = employList;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  // void dispose() {
  //   workerList = null;
  //   super.dispose();
  // }
  //

  // @override
  // void initState() {
  //   super.initState();
  //   _loading = true;
  //   WorkersDetail.getDetail().then((user) {
  //     setState(() {
  //       workerList = user;
  //       _loading = false;
  //     });
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail of  worker'),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.edit),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: null == workerList ? 0 : workerList.length,
          itemBuilder: (context, index) {
            Employ workerDetail = workerList[index];
            return Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Name'),
                          subtitle: Text(workerDetail.names ?? ''),
                        ),
                        ListTile(
                          title: Text('ID'),
                          subtitle: Text("${workerDetail.id}" ?? ''),
                        ),
                        ListTile(
                          title: Text('FatherName'),
                          subtitle: Text(workerDetail.fathername ?? ''),
                        ),
                        ListTile(
                          title: Text('MotherName'),
                          subtitle: Text(workerDetail.motherName ?? 'ERROR'),
                        ),
                        // ListTile(
                        //   title: Text('VILLAGE'),
                        //   subtitle: Text(workerDetail.tesh ?? ''),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditEmploy(
                            getWorkerData: workerDetail,
                          ),
                        ),
                      );
                      _loadData();
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Save'),
                )
              ],
            );
          },
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      // ),
    );
  }
}
