import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType ;
  final Function() onPerssed;

  const ContainerUnder({Key? key, required this.text, required this.onPerssed, required this.textType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color:  Get.isDarkMode ? mainColor :pinkClr,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
          text: text,
          fointSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          underLine: TextDecoration.none),

          TextButton(onPressed: onPerssed, child:
          TextUtils(
              text: textType,
              fointSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underLine: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
