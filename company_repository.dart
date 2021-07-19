import 'dart:core';

import 'package:calciumcarbonatecompany/data_base_employ.dart';

import 'data/db_employ.dart';

class CompanyRepository {
  // Future<List<Employ>> employs;
  // final formKey = new GlobalKey<FormState>();
  // List<Employ> employ;
  var helper = DBHelper();

  // static final Map<String, Employ>  = {
  //  'two': Employ(id: "two", name: 'Ram', fathername: "RamFather"),
  // };

  Future<List<Employ>> getCompanyList() async {
    // getEmploy.toString();
    var list = await helper.getEmploy();
    return list;
  }

  Future<void> addMember(Employ employ) async {
    try {
      await helper.save(employ);
    } catch (e) {
      print(e);
      print('We Cant Save The Member');
    }
    // employ.id = employ;
  }

  void updateMember(Employ employ) async {
    try {
      await helper.update(employ);
    } catch (e) {
      print(e);
      print(" Unable to Update the Member");
    }
    // [employ.id] = employ;
  }

  void deleteMember(String id) async {
    try {
      await helper.delete(id);
      print(id);
      // print('delete final');
      print('delete Memeber');
    } catch (e) {
      print(e);
      print('Cant Delete ID');
    }
    // .remove(id);
  }

  void cleanAllMember() {
    // Employ.clear();
  }
}
