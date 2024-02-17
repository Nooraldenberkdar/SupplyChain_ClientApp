import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/models/products_Model.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_Model.dart';

class CartController extends GetxController {
  CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> items = {};

  void addItem(ProductModel productModel, int quantity) {
    var totalQuantity = 0;
    if (items.containsKey(productModel.id!)) {
      items.update(
        productModel.id!,
        (value) {
          //value==productModel that already exist in cart
          totalQuantity = value.quantity! + quantity;
          return CartModel(
            id: value.id,
            img: value.img,
            name: value.name,
            price: value.price,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: productModel,
          ); //it return these updates version of cartItem to items above
        },
      );
      if (totalQuantity <= 0) items.remove(productModel.id);
    } else {
      //if the order is new he enter here
      if (quantity > 0) {
        items.putIfAbsent(
          productModel.id!,
          () {
            return CartModel(
              id: productModel.id,
              img: 'assets/images/ph1.png',
              name: productModel.name,
              price: productModel.price,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: productModel,
            );
          },
        );
      } else {
        Get.snackbar(
          "Itme count 😥",
          "You should add at least one item!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    }
    update();
  }

  bool existInCart(ProductModel productModel) {
    if (items.containsKey(productModel.id)) {
      return true;
    } else
      return false;
  }

  int getQuantity(ProductModel productModel) {
    var sum = 0;
    if (items.containsKey(productModel.id)) {
      items.forEach((key, value) {
        if (key == productModel.id) sum = value.quantity!;
      });
    }
    return sum;
  }

  int get totalItems {
    var totalItems = 0;
    items.forEach((key, value) {
      totalItems += value.quantity!;
    });
    return totalItems;
  }

  List<CartModel> get getItems {
    return items.entries.map(
      (e) {
        return e.value;
      },
    ).toList();
  }

  int get totalAmount {
    var total = 0;
    items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  void clearCart() {
    items.clear();
    update();
  }

// void checkOut() async {
//   SharedPreferences x = await SharedPreferences.getInstance();
//   final location_id = await x.getString(kAddressId);
//
//   final items = getItems;
//   final numDiffMeals = items.length;
//   List<String> meals_id = [];
//   for (int i = 0; i < numDiffMeals; i++) {
//     for (int j = 0; j < items[i].quantity!.toInt(); j++) {
//       meals_id.add(items[i].id!.toString());
//     }
//   }
//
//   final restaurant_id = items[0].product!.restaurantId.toString().trim();
//   OrderModel orderModel = OrderModel(location_id: location_id, restaurant_id: restaurant_id, meals_id: meals_id);
//   cartRepo.checkOut(orderModel);
// }
}
