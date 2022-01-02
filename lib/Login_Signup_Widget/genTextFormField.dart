

import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/DataBase/Comm/ValidationRejx.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/Constants/TextEditing.dart';

class getTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType inputType;
  bool isEnable;

  getTextFormField(
      {this.controller,
        this.hintName,
        this.icon,
        this.isObscureText = false,
        this.inputType = TextInputType.text,
        this.isEnable = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        enabled: isEnable,
        keyboardType: inputType,
        validator: (value){
          if(value==null || value.isEmpty){
            return'Please enter ${hintName}';
          }
          if(hintName=="Email"&&!validateEmail(value)){
            return 'Please Enter Valid Email';
          }
          return null;
        },
        decoration:InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.pink),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.blueAccent)
          ),
          prefixIcon: Icon(icon),
          hintText: hintName,
          labelText:hintName,
          fillColor: Colors.grey[200],
          filled: true,
        ) ,
      ),
    );
  }
}
