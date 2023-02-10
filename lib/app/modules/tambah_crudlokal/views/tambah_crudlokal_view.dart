import 'package:crudlokal/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tambah_crudlokal_controller.dart';

class TambahCrudlokalView extends GetView<TambahCrudlokalController> {
  final HomeController homecont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.fast_rewind,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'Tambah Memo',
            style: GoogleFonts.dmSerifText(
                fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 219, 255, 121),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 20),
          children: [
            TextField(
              controller: controller.teksnikC,
              autocorrect: false,
              decoration: InputDecoration(
                  label: Text("NIK",
                      style: GoogleFonts.almendraDisplay(
                          fontSize: 20, fontWeight: FontWeight.w300)),
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 3.0))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 5,
              controller: controller.teksnamaC,
              decoration: const InputDecoration(
                  label: Text("Nama"),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 3.0))),
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
                      borderSide: BorderSide(color: Colors.brown, width: 3.0))),
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
                      borderSide: BorderSide(color: Colors.brown, width: 3.0))),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () async {
                controller.tambahData();
                await homecont.dapatSemuamemo(); //refresh data memo
                Get.back(); //kembali ke halaman awal
              },
              child: Text(
                controller.istunggu.isFalse ? "Tambah Memo" : "Tunggu....",
                style: const TextStyle(
                    color: Color.fromARGB(255, 241, 241, 241),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }
}
