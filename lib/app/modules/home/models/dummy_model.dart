// To parse this JSON data, do
//
//     final dummyModel = dummyModelFromJson(jsonString);

import 'dart:convert';

DummyModel dummyModelFromJson(String str) =>
    DummyModel.fromJson(json.decode(str));

String dummyModelToJson(DummyModel data) => json.encode(data.toJson());

class DummyModel {
  DummyModel({
    required this.data,
  });

  List<Datum> data;

  factory DummyModel.fromJson(Map<String, dynamic> json) => DummyModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.nik,
    required this.nama,
    required this.umur,
    required this.kota,
  });

  String nik;
  String nama;
  int umur;
  String kota;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nik: json["nik"],
        nama: json["nama"],
        umur: json["umur"],
        kota: json["kota"],
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "nama": nama,
        "umur": umur,
        "kota": kota,
      };
}
