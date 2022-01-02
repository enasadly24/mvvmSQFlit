import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/DataBase/Comm/ValidationRejx.dart';
import 'package:mvvm_buildrealproject/DataBase/DbHelper.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/Constants/TextEditing.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/Login.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/genTextFormField.dart';
import 'package:mvvm_buildrealproject/Login_signup_Screens/LoginSignUpBackground.dart';
import 'package:mvvm_buildrealproject/Model/USer_Model.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
import 'package:mvvm_buildrealproject/ViewModel/UserViewModel.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var db;
  @override
  void initState() {
    super.initState();
    db= DbHelper();
  }
  signUp()async{
    String uid = conUserId.text;
    String uname = conUserName.text;
    String email = conEmail.text;
    String passwd = conPassword.text;
    String cpasswd = conCPassword.text;
     if(formKey.currentState.validate()){
       if(passwd!=cpasswd){
         alertDialog(context, "Password Mismatch");
       }else{
         formKey.currentState.save();
          UserModel userModel= UserModel(uid, uname,email, passwd);
          await db.saveData(userModel).then((userData){
            alertDialog(context, "Successfully Saved");
            Navigator.push(context,
                MaterialPageRoute(builder:(_)=>Login()));
          }).catchError((error){
            print(error);
            alertDialog(context, "Error:Data Save Fail");
          })
         ;
       }
     }
  }

  submit(){
    if(!formKey.currentState.validate()){
      return alertDialog(context, "not performed");
    }else
      formKey.currentState.save();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with Signup'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginSignupHeader('Signup'),
                  getTextFormField(
                      controller: conUserId,
                      icon: Icons.person,
                      hintName: 'User ID'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: conUserName,
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                      hintName: 'User Name'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: conEmail,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Email'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: conPassword,
                    icon: Icons.lock,
                    hintName: 'Password',
                    isObscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: conCPassword,
                    icon: Icons.lock,
                    hintName: 'Confirm Password',
                    isObscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: signUp,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Does you have account? '),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text('Sign In'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => Login()),
                                    (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
