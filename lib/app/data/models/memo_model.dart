class MemoModel {
  int? id;
  String? judul;
  String? isi;

  MemoModel({this.id, this.judul, this.isi});

  MemoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    isi = json['isi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['isi'] = isi;
    return data;
  }

  //fungsi tojsonlist utk menampilkan semua data
  static List<MemoModel> toJsonList(List? data) {
    if (data == null || data.isEmpty) return [];

    return data.map((e) => MemoModel.fromJson(e)).toList();
  }
}
