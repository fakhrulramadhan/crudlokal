import 'package:crudlokal/app/data/db/db_manager.dart';
import 'package:crudlokal/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class EditCrudlokalController extends GetxController {
  RxBool istunggu = false.obs;

  //TextEditingController teksnikC = TextEditingController();
  TextEditingController teksnamaC = TextEditingController();
  TextEditingController teksumurC = TextEditingController();
  TextEditingController tekskotaC = TextEditingController();

  HomeController homeC = Get.find(); //menemukan controller yang lain

  DatabaseManager database = DatabaseManager.instance;

  //fungsi edit memo
  void editMemo(int nik) async {
    Database db = await database.db;

    await db.update(
        "memo",
        {
          "nama": teksnamaC.text,
          "umur": teksumurC.text,
          "kota": tekskotaC.text
        },
        where: "nik = ?",
        whereArgs: [nik],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void hapusMemo(int nik) async {
    Database db = await database.db;

    await db.delete("memo", where: "nik = ?", whereArgs: [nik]);

    //homeC.dapatSemuamemo(); //agar dapat bisa refresh tampilan,ditaruh di view
  }
}
