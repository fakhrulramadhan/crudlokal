import 'package:get/get.dart';

import '../controllers/edit_crudlokal_controller.dart';

class EditCrudlokalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCrudlokalController>(
      () => EditCrudlokalController(),
    );
  }
}
