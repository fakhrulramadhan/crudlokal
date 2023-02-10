import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';

class TambahCrudlokalController extends GetxController {
  RxBool istunggu = false.obs;

  DatabaseManager database = DatabaseManager.instance;
  TextEditingController teksnikC = TextEditingController();
  TextEditingController teksnamaC = TextEditingController();
  TextEditingController teksumurC = TextEditingController();
  TextEditingController tekskotaC = TextEditingController();
  //fungsi tambah data SQL
  void tambahData() async {
    if (teksnikC.text.isNotEmpty &&
        teksnamaC.text.isNotEmpty &&
        teksumurC.text.isNotEmpty &&
        tekskotaC.text.isNotEmpty) {
      istunggu.value = true;

      Database db = await database.db;

      db.insert("crudlokal", {
        "nik": teksnikC.text,
        "nama": teksnamaC.text,
        "umur": teksumurC.text,
        "kota": tekskotaC.text
      });

      istunggu.value = false;
    }
  }
}
