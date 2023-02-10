import 'package:crudlokal/app/data/models/crudlokal_model.dart';
import 'package:crudlokal/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_crudlokal_controller.dart';

class EditCrudlokalView extends GetView<EditCrudlokalController> {
  //ambil parameter arguments
  CrudlokalModel datapeserta = Get.arguments;

  //memanggil homecontroller dengan getfind
  HomeController homeC = Get.find();

  @override
  Widget build(BuildContext context) {
    //mengambil data teksfield berdasarkan yang sudah diisi sebelumnya
    controller.teksnamaC.text = datapeserta.nama!;
    controller.teksumurC.text = datapeserta.umur!;
    controller.tekskotaC.text = datapeserta.kota!;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Memo',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 219, 255, 121),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 20),
          children: [
            TextField(
              controller: controller.teksnamaC,
              autocorrect: false,
              decoration: const InputDecoration(
                  label: Text("Nama",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 5,
              controller: controller.teksumurC,
              decoration: const InputDecoration(
                  label: Text("Umur"),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 5,
              controller: controller.tekskotaC,
              decoration: const InputDecoration(
                  label: Text("Kota"),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown))),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() => TextButton(
                  onPressed: () async {
                    controller.editMemo(datapeserta.nik!);
                    await homeC.dapatSemuamemo();
                    Get.back();
                  },
                  child: Text(
                    controller.istunggu.isFalse ? "Edit Memo" : "Tunggu....",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 25, 112, 76)),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () async {
                controller.hapusMemo(datapeserta.nik!);
                await homeC.dapatSemuamemo();
                Get.back();
              },
              child: Text(
                controller.istunggu.isFalse ? "Hapus Memo" : "Tunggu...",
                style:
                    const TextStyle(color: Color.fromARGB(255, 212, 46, 171)),
              ),
            )
          ],
        ));
  }
}
