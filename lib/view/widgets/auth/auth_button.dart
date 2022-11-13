import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: Get.isDarkMode ? mainColor :pinkClr
            , minimumSize: const Size(360, 50)),

        child: TextUtils(
          text: text,
          color:Colors.white ,
          fontWeight: FontWeight.bold,
          underLine: TextDecoration.none,
          fointSize: 18,
        ));
  }
}
