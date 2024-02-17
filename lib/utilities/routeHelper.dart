import 'package:get/get.dart';
import 'package:trademale/pages/cart/cart_page.dart';
import 'package:trademale/pages/cart/ordersHistory_page.dart';
import 'package:trademale/pages/home/home_page.dart';
import 'package:trademale/pages/onBoarding/gettingStarted_page.dart';
import 'package:trademale/pages/profile/profile.dart';
import 'package:trademale/pages/signIn/signIn_page.dart';
import 'package:trademale/pages/signUp/deliveryAddress_page.dart';
import 'package:trademale/pages/signUp/signUp1_page.dart';

import '../pages/home/suppliers/product_page.dart';
import '../pages/home/suppliers/supplier_page.dart';
import '../pages/home/suppliers/suppliers_page.dart';

//main senario: when you get.toNamed(some fun) this fun returns a path that getx know it in getPage list .
class routeHelper {
  // static String splash = '/splash-page';
  static String getstarted = '/getStarted';
  static String initial = '/';
  static String signUp = '/signUpPage';
  static String signIn = '/signInPage';
  static String deliveryAddress = '/deliveryAddressPage';
  static String productDetails = '/productPage';
  static String suppliers = '/suppliersPage';
  static String supplier = '/supplierPage';
  static String cart = '/cartPage';
  static String profile = '/profilePage';
  static String history = '/historyPage';

  // static String getSplash() => splash;

  static String getStarted() => getstarted;

  static String getInitial() => initial;

  static String getSignUp() => signUp;

  static String getSignIn() => signIn;

  static String getDeliveryAddress() => deliveryAddress;

  static String getProductDetails(int pageId, String oldPage,
          {int? supplierId}) =>
      '$productDetails?pageId=$pageId&oldPage=$oldPage' +
      (supplierId != null ? '&supplierId=$supplierId' : '');

  static String getSuppliers() => suppliers;

  static String getSupplier(int pageId) => '$supplier?pageId=$pageId';

  static String getCart() => cart;

  static String getProfile() => profile;

  static String getHistory() => history;

  static List<GetPage> routes = [
    // GetPage(
    //   name: splash,
    //   page: () => SplashScreen(),
    // ),
    GetPage(
      name: getstarted,
      page: () => GetStartedPage(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: signUp,
      page: () => SignUpPage(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: signIn,
      page: () => SignInPage(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: deliveryAddress,
      page: () => DeliveryAddressPage(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: productDetails,
      page: () {
        var pageId = Get.parameters['pageId'];
        var oldPage = Get.parameters['oldPage'];
        var supplierId = int.tryParse(Get.parameters['supplierId'] ?? '');
        return ProductPage(
          pageId: int.parse(pageId!),
          oldPage: oldPage!,
          supplierId: supplierId,
        );
      },
    ),
    GetPage(
        transition: Transition.fadeIn,
        name: suppliers,
        page: () => SuppliersPage()),
    GetPage(
      transition: Transition.fadeIn,
      name: supplier,
      page: () {
        var pageId = Get.parameters['pageId'];
        return SupplierPage(
          pageId: int.parse(pageId!),
        );
      },
    ),
    GetPage(
      name: cart,
      page: () => CartPage(),
    ),
    GetPage(
      name: profile,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: history,
      page: () => OrdersHistoryPage(),
    ),
  ];
}
