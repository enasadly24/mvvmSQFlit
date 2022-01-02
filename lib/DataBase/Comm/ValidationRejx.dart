
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

alertDialog(BuildContext context,String msg){
  Toast.show(msg, context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
}

validateEmail(String email){
  final emailReg = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}
validatePhoneNumber(int PhoneNumber){
 final PhoneReg= new RegExp(
     r'(^(?:[+0]9)?[0-9]{10,12}$)');

 return PhoneReg.hasMatch(PhoneNumber.toString());
}

validatePassword(String Password){
final PasswordRegx= new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]{2})(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8}$');

return PasswordRegx.hasMatch(Password);
}
