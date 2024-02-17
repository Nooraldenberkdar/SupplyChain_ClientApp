import 'package:get/get.dart';
import 'package:trademale/conrtollers/Products_controller.dart';
import 'package:trademale/conrtollers/suppliers_controller.dart';
import 'package:trademale/data/repository/Products_repo.dart';
import 'package:trademale/data/repository/cart_repo.dart';
import 'package:trademale/data/repository/suppliers_repo.dart';

import '../conrtollers/cart_controller.dart';
import '../data/api/apiClient.dart';
import '../utilities/constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: kBaseUrl));
//repos
  Get.lazyPut(() => ProductsRepo(apiClient: Get.find()));
  Get.lazyPut(() => SuppliersRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(apiClient: Get.find()));

//controllers
  Get.lazyPut(() => ProductsController(productsRepo: Get.find()));
  Get.lazyPut(() => SuppliersController(suppliersRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
