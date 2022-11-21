
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';

import '../../../utiils/theme.dart';
import '../text_utils.dart';


class LogOutWidget extends StatelessWidget {
   LogOutWidget({Key? key}) : super(key: key);


  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) => Material(
      color : Colors.transparent,
      child: InkWell(
        onTap: (){


          Get.defaultDialog(
            title: "Logout From App",
            titleStyle : const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            middleText: 'Are you sure you need to logout',
            middleTextStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            backgroundColor: Colors.grey,
            radius: 10,
            textCancel: "No",
            cancelTextColor: Colors.white,
            textConfirm: "YES",
            confirmTextColor: Colors.white,
            onCancel: (){
              Get.back();
            },
            onConfirm: (){
              controller.signOutFromApp();
            },
            buttonColor: Get.isDarkMode ? pinkClr :mainColor,

          );

        },
        splashColor: Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: darkSettings,

              ),
              child: const  Icon(
                Icons.logout,
                color: Colors.white,
              ) ,
            ),
            const SizedBox(
              width: 20,
            ),

            TextUtils(
                text: "Logout".tr,
                fointSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none
            ),
          ],
        ),
      ),
    ));
  }
}
