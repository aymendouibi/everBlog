// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:everblog/const/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  String hint;
  bool obscure;
  MyTextField({required this.controller, required this.hint, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      autofocus: false,
      decoration: InputDecoration(
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(30.0),
          ),
          hintStyle:
              TextStyle(color: Color.fromARGB(255, 54, 1, 65), ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 243, 243, 243)),
      controller: controller,
      obscureText: obscure,
    );
  }
}
