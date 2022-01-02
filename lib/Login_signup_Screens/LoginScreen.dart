/*
import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/Login.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/genTextFormField.dart';
import 'package:mvvm_buildrealproject/Login_signup_Screens/LoginSignUpBackground.dart';

class LoginScreen extends StatelessWidget {
  Login log;
  // LoginScreen({this.login});
   getTextFormField txt;
   final _conUserId = TextEditingController();
   final _conPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginSignupHeader("Login"),
              getTextFormField(
                controller:_conUserId ,
                icon: Icons.person,
                hintName: "User ID",
              ),
              SizedBox(height: 10.0),
              getTextFormField(
                controller:_conPassword ,
                icon: Icons.lock,
                hintName: "Password",
                isObscureText: true,
              ),
              Container(
                margin: EdgeInsets.all(30.0),
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed:,
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
                    Text('Does not have account? '),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text('Signup'),
                      onPressed: () {
                  */
/* Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignupForm()));*//*


                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

*/
