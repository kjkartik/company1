import 'dart:core';

import 'package:calciumcarbonatecompany/company_repository.dart';
import 'package:calciumcarbonatecompany/data/db_employ.dart';
import 'package:calciumcarbonatecompany/ui/ui_add_employ.dart';
import 'package:calciumcarbonatecompany/ui/ui_worker_detail_page.dart';
import 'package:flutter/material.dart';
// mport 'package:flutter_bloc/flutter_bloc.dart';

class WorkerListPage extends StatefulWidget {
  @override
  _WorkerListPageState createState() => _WorkerListPageState();
}

class _WorkerListPageState extends State<WorkerListPage> {
  // final worker = Employ();
  // final Employ worker;
  // Future<List<Employ>> employ;
  // _WorkerListPageState({
  //   this.worker,
  // ignore: unused_element
//  });

  final _repository = CompanyRepository();
  List<Employ> workerList;
  bool _loading;

  Future<void> loadData() async {
    print('Enter in load data setState');
    try {
      var list = await _repository.getCompanyList();
      setState(() {
        workerList = list;
        // list = workerList;
      });
    } catch (e) {
      // TODO
      print(e);
      print("Failed to LoadData");
    }
  }

  Future<void> deleteData(String id) async {
    try {
      await _repository.deleteMember(id);
      print(id);
      print('delete Data');
      _loading = false;
      loadData();
    } catch (e) {
      print(e);
      print('error');
    }
  }

  Future<void> clearAllEmploy() async {
    try {
      await _repository.cleanAllMember();
      loadData();
    } catch (e) {
      print(e);
      print('WeCantCleanMember');
    }
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    final DateTime id = DateTime.fromMillisecondsSinceEpoch(1546553448639);
    loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEmploy(),
                ),
              );
              loadData();
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              print('enter');
              clearAllEmploy();
            },
          ), //
        ],
        title: Text('WorkerList'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: null == workerList ? 0 :
          //
          workerList.length,
          itemBuilder: (context, index) {
            Employ workers = workerList[index];
            // print(workers);
            // print(workers.motherName);

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            // deleteData(workers.id);
                            // print(workers.id);
                          },
                          alignment: Alignment.bottomLeft,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    workers.fathername ??
                    'fatherName',
                    style: TextStyle(
                      fontSize: (20),
                    ),
                  ),
                  subtitle: Text(
                    workers.id ??
                    "id",
                    style: TextStyle(
                      fontSize: (20),
                    ),
                  ),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkerDetailPage(),
                      ),
                    );
                    loadData();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
