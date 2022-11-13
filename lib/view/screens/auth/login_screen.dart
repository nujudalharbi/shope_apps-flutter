import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/view/screens/auth/forgot_password.dart';

import '../../../routes/routes.dart';
import '../../../theme.dart';
import '../../../utiils/my_string.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          //لازاله الخط الفاصل في app bar
          elevation: 0,
        ),
        // backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 40,
                  ),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              fointSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'IN',
                              fointSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                            controller: passwordController,
                            obscureText: controller.isVisiblity ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer or equle to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset("assets/images/lock.png")
                                : const Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixicon: IconButton(
                                onPressed: () {
                                  controller.Visiblity();
                                },
                                icon: controller.isVisiblity
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )),
                            hintText: 'Password',
                          );
                        }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {

                              Get.toNamed(Routes.forgetPasswordScreen);
                            },
                            child: TextUtils(
                                text: "Forget Password",
                                fointSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                underLine: TextDecoration.none),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                       GetBuilder<AuthController>(builder: (_){
                         return  AuthButton(
                           text: 'LOG IN',
                           onPressed: () {
                             if (fromKey.currentState!.validate()){
                               String email = emailController.text.trim();
                               String password = passwordController.text;
                               controller.logInUsingFirebase(email: email, password: password);
                             }


                           },
                         );

                       }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                            text: "OR",
                            fointSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            underLine: TextDecoration.none),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){

                                controller.faceBookSignUpApp();
                              },
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                         GetBuilder<AuthController>(builder: (_){
                           return  InkWell(onTap: (){

                             controller.googleSingUpApp();

                           },
                             child: Image.asset("assets/images/google.png"),
                           );
                         })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't have an acount?",
                onPerssed: () {
                  Get.offNamed(Routes.signupScreen);
                },
                textType: 'sign up ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
