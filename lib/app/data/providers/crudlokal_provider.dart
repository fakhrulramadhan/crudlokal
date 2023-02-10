import 'package:get/get.dart';

import '../models/crudlokal_model.dart';

class CrudlokalProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return CrudlokalModel.fromJson(map);
      if (map is List) {
        return map.map((item) => CrudlokalModel.fromJson(item)).toList();
      }
    };
    //httpClient.baseUrl = 'http://103.146.244.206:600/b7/datadummy.php';
  }

  Future<CrudlokalModel?> getMemo(int id) async {
    final response = await get('memo/$id');
    return response.body;
  }

  Future<Response<CrudlokalModel>> postMemo(CrudlokalModel memo) async =>
      await post('memo', memo);
  Future<Response> deleteMemo(int id) async => await delete('memo/$id');
}
