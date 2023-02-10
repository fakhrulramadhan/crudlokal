import 'package:crudlokal/app/modules/home/models/dummy_model.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../data/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';
import '../../../data/models/crudlokal_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  late DummyModel datadummy;
  RxList semuaMemo = <CrudlokalModel>[].obs;

  DatabaseManager database = DatabaseManager.instance;

  Future ambilAPI() async {
    try {
      var responsenanti = await http
          .get(Uri.parse("http://103.146.244.206:600/b7/datadummy.php"));

      print(responsenanti.body);
      print("======");

      Map<String, dynamic> palsudata =
          json.decode(responsenanti.body) as Map<String, dynamic>;

      //print(palsu);

      datadummy = DummyModel.fromJson(palsudata);

      // print(dataPalsu.deaths.value);
    } catch (e) {
      print("Terjadi Kesalahan");
      print(e);
    }
  }

  Future dapatSemuamemo() async {
    Database db = await database.db;

    //buat ambil data tabel dengan .query
    List<Map<String, dynamic>> data = await db.query("crudlokal");

    if (data.isNotEmpty) {
      //semua data semuamemo langsung tambah ke memo tojsonlist
      semuaMemo(CrudlokalModel.toJsonList(data));
      semuaMemo.refresh(); //refresh database
    } else {
      //diclearkan,semua data kosong
      semuaMemo.clear();
      semuaMemo.refresh();
    }
  }
}
