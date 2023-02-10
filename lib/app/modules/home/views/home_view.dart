import 'dart:convert';

import 'package:crudlokal/app/data/models/crudlokal_model.dart';
import 'package:crudlokal/app/modules/home/models/dummy_model.dart';
import 'package:crudlokal/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as httpw;

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  late DummyModel dataPalsu;

  //bikin variabel user, bentuk list kosong,
//agar semua dataya bisa ditampung
  List<Map<String, dynamic>> semuaUser = [];

  Future ambilnanti() async {
    try {
      var responsenanti = await httpw
          .get(Uri.parse("http://103.146.244.206:600/b7/datadummy.php"));

      print(responsenanti.body);
      print("====== Pemisah");
      //print(responsenanti.body["data"]);

      // Map<String, dynamic> palsudata =
      //     json.decode(responsenanti.body) as Map<String, dynamic>;
      // print(palsudata["data"][0]["nik"]);

      List dataku =
          (json.decode(responsenanti.body) as Map<String, dynamic>)["data"];
      //print(dataku);

      return dataku;

      // dataku.forEach((element) {
      //   //menammbahkan data user ke list semuauser
      //   semuaUser.add(element);

      //   print(semuaUser);
      // });
    } catch (e) {
      print("Terjadi Kesalahan");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder(

                //bikin variabel untuk dieksekusi futurenya dulu
                future: ambilnanti(),
                //widget buildernya
                builder: (context, snapshot) {
                  print(snapshot.data);
                  //tergantung koneksi internetnya
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Text("Menunggu..."));
                  } else {
                    //handling kalau di data api nya tidak ada
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text("Tidak ada data"),
                      );
                    }

                    //kalau ada data apinya, maka muncul data penggunanya
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        // leading: CircleAvatar(
                        //   backgroundColor: Colors.black26,
                        //   //url apinya sudah dalam bentuk string
                        //   backgroundImage:
                        //       NetworkImage("${semuaUser[index]['avatar']}"),
                        // ),
                        // title: Text("Hahaha"),
                        //memanggil masing masing data dengan index ke berapa
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NIK: ${snapshot.data[index]['nik']}"),
                            Text("Nama: ${snapshot.data[index]['nama']}"),
                            Text("Umur: ${snapshot.data[index]['umur']}"),
                            Text("Kota: ${snapshot.data[index]['kota']}"),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      itemCount: 5,
                    );
                  }
                }),
            const SizedBox(
              height: 20.0,
            ),
            FutureBuilder(

                //bikin variabel untuk dieksekusi futurenya dulu
                future: controller.dapatSemuamemo(),

                //widget buildernya
                builder: (context, snapshot) {
                  print(snapshot.data);
                  //tergantung koneksi internetnya
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Text("Menunggu..."));
                  } else {
                    //handling kalau di data api nya tidak ada
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text("Tidak ada data"),
                      );
                    }

                    //kalau ada data apinya, maka muncul data penggunanya
                    return ListView.builder(
                        itemCount: controller.semuaMemo.length,

                        //agar bisa discroll
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          //ototmatis dapat no index
                          CrudlokalModel datapeserta =
                              controller.semuaMemo[index];

                          return ListTile(
                            onTap: () {
                              Get.toNamed(Routes.EDIT_CRUDLOKAL,
                                  arguments: datapeserta);
                            },
                            // leading: CircleAvatar(
                            //   backgroundColor: Colors.black26,
                            //   //url apinya sudah dalam bentuk string
                            //   backgroundImage:
                            //       NetworkImage("${semuaUser[index]['avatar']}"),
                            // ),
                            // title: Text("Hahaha"),
                            //memanggil masing masing data dengan index ke berapa
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("NIK: ${datapeserta.nik}"),
                                Text("Nama: ${datapeserta.nama}"),
                                Text("Umur: ${datapeserta.umur}"),
                                Text("Kota: ${datapeserta.kota}"),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          );
                        });
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_CRUDLOKAL);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
