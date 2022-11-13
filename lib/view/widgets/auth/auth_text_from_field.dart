import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;

  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixicon;
  final String hintText;
  final Function validator;


  const AuthTextFormField({Key? key,
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.prefixIcon,
    required this.suffixicon,
    required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      //القيم واضحه او مخفيه
      obscureText: obscureText,
    //  تغير لون المؤشر
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon: suffixicon,
        hintText:hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
          //عرض تعبئه text_field
          filled: true,
        enabledBorder: OutlineInputBorder(
          //لون اطار text_field
          borderSide: const BorderSide(color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        //وظيفه focus لما يتفعل عند الكتابه يكون بدون اطار
        focusedBorder: OutlineInputBorder(
      //لون اطار text_field
      borderSide: const BorderSide(color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
        errorBorder: OutlineInputBorder(
          //لون اطار text_field
          borderSide: const BorderSide(color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          //لون اطار text_field
          borderSide: const BorderSide(color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
