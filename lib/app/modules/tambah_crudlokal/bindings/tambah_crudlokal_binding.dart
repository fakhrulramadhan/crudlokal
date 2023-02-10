import 'package:get/get.dart';

import '../controllers/tambah_crudlokal_controller.dart';

class TambahCrudlokalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahCrudlokalController>(
      () => TambahCrudlokalController(),
    );
  }
}
