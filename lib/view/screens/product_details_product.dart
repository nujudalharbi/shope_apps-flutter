

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/product_model.dart';

import '../widgets/product_details/add_cart.dart';
import '../widgets/product_details/clothes_info.dart';
import '../widgets/product_details/image_sliders.dart';
import '../widgets/product_details/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {

  final ProductModel productModel;
  const ProductDetailsScreen({Key? key, required this.productModel, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
backgroundColor: context.theme.backgroundColor,

body: SingleChildScrollView(
  child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageSliders(imageUrl: productModel.image,),
        ClothesInfo(
          title: productModel.title,
          productId: productModel.id,
        rate: productModel.rating.rate,
          description: productModel.description,),
        const SizeList(),
      AddCart(price: productModel.price,
      productModel: productModel,),

      ],
  ),
) ,
      ),
    );
  }
}
