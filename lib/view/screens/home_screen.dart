import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../widgets/home/search_text_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? darkGreyClr : mainColor,
                  borderRadius:const BorderRadius.only(
bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child:Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(
                          text: "Find You",
                          fointSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          underLine: TextDecoration.none),
                     const SizedBox(height: 5,),
                      TextUtils(
                          text: "INSPIRATION",
                          fointSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          underLine: TextDecoration.none),
                     const SizedBox(height: 20,),
                      SearchFormText(),

                    ],
                  ),
                ),
              ),

            ],


          ),
        ),

    );
  }
}
