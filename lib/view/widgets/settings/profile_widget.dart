
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/logic/controllers/setting_controller.dart';
import 'package:shop_app/view/widgets/text_utils.dart';
class ProfileImage extends StatelessWidget {
   ProfileImage({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() =>
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:authController.displayUserPhoto.value.isNotEmpty
                            ? NetworkImage(authController.displayUserPhoto.value)
                            : NetworkImage("https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1600&q=60"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        text: controller.capitalize(authController.displayUserName.value),
                        fointSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none
                    ),

                    TextUtils(
                        text: authController.displayUserEmail.value,
                        fointSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none
                    ),
                  ],
                ),
              ],
            ),)
      ],
    );
  }
}
