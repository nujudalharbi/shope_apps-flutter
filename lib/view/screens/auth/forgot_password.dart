import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/view/widgets/auth/auth_button.dart';

import '../../../utiils/my_string.dart';
import '../../widgets/auth/auth_text_from_field.dart';


class ForgetPasswordScreen extends StatelessWidget {
    ForgetPasswordScreen ({Key? key}) : super(key: key);
    final forKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();

    final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          centerTitle: true,
          elevation: 0,
          title: Text('Forgot Password '
          , style: TextStyle(color:  Get.isDarkMode ? mainColor : pinkClr,
            ),
          ),
leading: IconButton(
  onPressed:(){

    Get.back();
  } ,
  icon: Icon(Icons.arrow_back,
  color: Get.isDarkMode ? Colors.black : Colors.white ),

),
        ),
        // backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: Form(
          key: forKey ,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(onPressed: (){
                      Get.back();
                    },
                        icon: Icon(Icons.close_rounded),
                    color: Colors.white,),
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  Text("If you want to recover your a count ,then please provide your email ID blow..",
                  textAlign: TextAlign.center
                  ,style: TextStyle(

                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset('assets/images/forgetpass copy.png',
                  width: 250,),
                  const SizedBox(height: 50,),
                  AuthTextFormField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Image.asset("assets/images/email.png")
                        : Icon(
                      Icons.email,
                      color: pinkClr,
                      size: 30,
                    ),
                    suffixicon: const Text(""),
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 50,),
                 
GetBuilder<AuthController>(builder: (_){
  return  AuthButton(text: "SEND", onPressed: (){
    if(forKey.currentState!.validate()){
      String email = emailController.text.trim();
      controller.resetPassword(email);
    }
    
    
  }
  );
})
              ],
            ),
            ),
          ),
        ),

      ),


    );
  }
}
