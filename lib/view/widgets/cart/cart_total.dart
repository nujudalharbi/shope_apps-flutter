
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/cart_controoler.dart';
import 'package:shop_app/utiils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class   CertTotal extends StatelessWidget {
 CertTotal({Key? key}) : super(key: key);
 final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Container(
      padding:const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: "Total",
                  fointSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  underLine: TextDecoration.none
              ),
              Text("\$${controller.total}",
                style: TextStyle(
                  color: Get.isDarkMode ?  Colors.white  : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation:0,
                    primary:Get.isDarkMode ? pinkClr : mainColor
                ),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Check out",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart),
                  ],
                ),),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
