import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/Login.dart';

class TextEdit{
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType inputType;
  bool isEnable;
 TextEdit({
   this.controller,
   this.hintName,
   this.icon,
   this.isObscureText=false,
   this.inputType=TextInputType.text,
   this.isEnable=true
 });
}

  final conUserId = TextEditingController();
  final conUserName = TextEditingController();
  final conEmail = TextEditingController();
  final conPassword = TextEditingController();
  final conCPassword = TextEditingController();
  final UserId= TextEditingController();
  final UserPassword=TextEditingController();
  final LoginconUserId = TextEditingController();
  final LoginconPassword = TextEditingController();


