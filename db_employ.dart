import 'dart:core';

import 'package:calciumcarbonatecompany/data_base_employ.dart';

class Employ {
  // final addEmploy = AddEmploy();
  final String tesh;
  final String id;
  final String names;
  final String fathername;
  final String motherName;
  final String vill;

  Employ({
    this.tesh,
    this.id,
    this.names,
    this.fathername,
    this.motherName,
    this.vill,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': names,
      'fatherName': fathername,
      // 'motherName': motherName,
    };
    return map;
  }

  factory Employ.fromMap(Map<String, dynamic> map) {
    return Employ(
      names: map[DBHelper.NAME],
      id: map[DBHelper.ID],
      fathername: map[DBHelper.FATHERNAME],
      // motherName: map[DBHelper.MOTHERNAME],
    );
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}
