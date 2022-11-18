import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/cart_controoler.dart';
import 'package:shop_app/utiils/theme.dart';

import '../widgets/cart/cart_product_cart.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: const Text("Cart Item"),
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    controller.clearAllProducts();
                  },
                  icon: const Icon(Icons.backspace)),
            ],
          ),
          body: Obx(() {
            {
              if (controller.productsMap.isEmpty) {
                return EmptyCart();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 600,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return CartProductCart(
                                  index: index,
                                  productModel: controller.productsMap.keys
                                      .toList()[index],
                                  quantity: controller.productsMap.values
                                      .toList()[index],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 20,
                                  ),
                              itemCount: controller.productsMap.length)),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: CertTotal(),
                      ),
                    ],
                  ),
                );
              }
            }
          })
          // EmptyCart(),
          ),
    );
  }
}
