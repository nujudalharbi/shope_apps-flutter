import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../../../theme.dart';
import '../../../utiils/theme.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder:(_) {
      return  Row(
        children: [
          InkWell(
            onTap: (){
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child:controller.isCheckBox
                  ? Get.isDarkMode
                  ? Image.asset('assets/images/check.png')
                  : const Icon(Icons.done , color: pinkClr,)
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(fointSize: 16,
                  fontWeight: FontWeight.normal,
                  text: "I accept  ",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              TextUtils(fointSize: 16,
                  fontWeight: FontWeight.normal,
                  text: "terms & conditions",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.underline
              ),
            ],
          ),
        ],
      );
    });
  }
}

