import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/models/facebook_model.dart';

import '../../routes/routes.dart';

class AuthController extends GetxController {
  bool isVisiblity = false;
  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserEmail = ''.obs;
  var displayUserPhoto = ''.obs;
  var googleSignIn = GoogleSignIn();
  FaceBookModel? faceBookModel;
  var isSingIn = false ;
  final GetStorage authBox = GetStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  User?get userProfile => auth.currentUser;
  @override
  void onInit() {
  //  ---*


  //---*
  displayUserName.value = (userProfile != null ?  userProfile!.displayName : "" )!;


  displayUserEmail.value = (userProfile != null ?  userProfile!.email : "" )!;
    super.onInit();

  }


  void Visiblity() {
    isVisiblity = !isVisiblity;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  //-------------------------------------------------------
  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(

        email: email,
        password: password,


      )
          .then((value) {
        displayUserName.value = name;
        displayUserEmail.value = email;
        auth.currentUser!.updateDisplayName(name);
      });

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = 'provided password  too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  //---------------------------------------
  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName.value = auth.currentUser!.displayName!);
      isSingIn = true;
authBox.write("auth", isSingIn);

      
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = "No user found for that email $email.";
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
  //----------------------------------------------

  void googleSingUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;


      //------************
      displayUserPhoto = googleUser.photoUrl! as RxString;
      displayUserEmail.value = googleUser.email;


      GoogleSignInAuthentication googleSignInAuthentication =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      //----------****************
      isSingIn = true;
      authBox.write("auth", isSingIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  //---------------------------------------------
  void faceBookSignUpApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
 final data = await FacebookAuth.instance.getUserData();
 faceBookModel = FaceBookModel.fromJson(data);

 print("______________");
print(faceBookModel!.email);
    print(faceBookModel!.name);
    isSingIn = true;
    authBox.write("auth", isSingIn);

    update();
    Get.offNamed(Routes.mainScreen);
  }

  //----------------------------------------------
  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = "No user found for that email $email.";
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  //--------------------------------
  void signOutFromApp() async{

    try{
 await auth.signOut();
 await googleSignIn.signOut();
 // await FacebookAuth.i.logOut();
 displayUserName.value = "";
 //displayUserPhoto = "";
 isSingIn = false;
 authBox.remove('auth');
 update();

Get.offNamed(Routes.welcomeScreen);
    }
        catch(error){

          Get.snackbar(
            "Error!",
            error.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
  }
}

//
//
//
// void signUpUsingFirebase
//     ({
//
//   required String name,
//   required String email,
//   required String password,
//
// }) async {
//
//   try {
//     await auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//
//     );
//     update();
//   } on FirebaseAuthException catch (error) {
//     String title = error.code;
//     String message = '';
//
//
//     if (error.code == 'weak-password') {
//
//       message = 'The password provided is too weak.';
//
//     } else if (error.code == 'email-already-in-use') {
//
//       message = 'The account already exists for that email.';
//     } else{
//
//       message = error.message.toString();
//
//     }
//     Get.snackbar(title,
//         message ,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green,
//         colorText: Colors.white);
//
//   } catch (error) {
//     Get.snackbar('Error!',
//         error.toString() ,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green,
//         colorText: Colors.white);
//   }
//
// }
