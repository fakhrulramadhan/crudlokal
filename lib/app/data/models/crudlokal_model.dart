class CrudlokalModel {
  int? nik;
  String? nama;
  String? umur;
  String? kota;

  CrudlokalModel({this.nik, this.nama, this.umur, this.kota});

  CrudlokalModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    umur = json['umur'];
    kota = json['kota'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nik'] = nik;
    data['nama'] = nama;
    data['umur'] = umur;
    data['kota'] = kota;
    return data;
  }

  //fungsi tojsonlist utk menampilkan semua data
  static List<CrudlokalModel> toJsonList(List? data) {
    if (data == null || data.isEmpty) return [];

    return data.map((e) => CrudlokalModel.fromJson(e)).toList();
  }
}
