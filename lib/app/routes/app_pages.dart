import 'package:get/get.dart';

import 'package:crudlokal/app/modules/edit_crudlokal/bindings/edit_crudlokal_binding.dart';
import 'package:crudlokal/app/modules/edit_crudlokal/views/edit_crudlokal_view.dart';
import 'package:crudlokal/app/modules/home/bindings/home_binding.dart';
import 'package:crudlokal/app/modules/home/views/home_view.dart';
import 'package:crudlokal/app/modules/tambah_crudlokal/bindings/tambah_crudlokal_binding.dart';
import 'package:crudlokal/app/modules/tambah_crudlokal/views/tambah_crudlokal_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_CRUDLOKAL,
      page: () => EditCrudlokalView(),
      binding: EditCrudlokalBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_CRUDLOKAL,
      page: () => TambahCrudlokalView(),
      binding: TambahCrudlokalBinding(),
    ),
  ];
}
