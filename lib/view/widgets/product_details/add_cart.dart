import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/cart_controoler.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/utiils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModel productModel;
 AddCart({Key? key, required this.price, required this.productModel}) : super(key: key);


  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: "Price",
                  fointSize: 16 ,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  underLine: TextDecoration.none),
              Text("\$$price",
              style: TextStyle
                (
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
              ),
            ],
            
          ),
          const SizedBox(
            width: 20 ,
          ),
          Expanded(
            
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor
                ),
                  onPressed: (){
controller.addProductTotalCart(productModel);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                     Text("Add to Cart",
                       style: TextStyle
                         (
                         color:  Colors.white ,
                         fontSize: 20,


                       ),
                     ),
            SizedBox(width: 10,),
                      Icon(Icons.shopping_cart_outlined)
                    ],
                  )),
            ),
          )
        ],
      ),




    );
  }
}
