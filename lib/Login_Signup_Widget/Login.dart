import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/DataBase/Comm/ValidationRejx.dart';
import 'package:mvvm_buildrealproject/DataBase/DbHelper.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/Constants/TextEditing.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/genTextFormField.dart';
import 'package:mvvm_buildrealproject/Login_signup_Screens/LoginSignUpBackground.dart';
import 'package:mvvm_buildrealproject/Login_signup_Screens/SignUp.dart';
import 'package:mvvm_buildrealproject/Model/USer_Model.dart';
import 'package:mvvm_buildrealproject/Pages/newsListPage.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  _LoginState log;

  @override
  _LoginState createState() => _LoginState();
  State<StatefulWidget>createstate(){
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  var db;
  bool isLoggedIn=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      db= DbHelper();
      autoLogIn();
  }
  loginfunction()async{
    String uid =  LoginconUserId.text;
    String passwd = LoginconPassword.text;

    if (uid.isEmpty) {
      alertDialog(context, "Please Enter User ID");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Please Enter Password");
    } else {
      await db.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
          storData(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => NewsList()),
                    (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Login Fail");
      });
    }
  }
  Future storData(UserModel user)async{
    SharedPreferences sp= await SharedPref.ReturnShared();
    sp.setString("User_Id", user.user_id);
    sp.setString("User_Name", user.user_name);
    sp.setString("Email", user.email);
    sp.setString("Password", user.password);
  }

  void autoLogIn()async{
    SharedPreferences auto=await SharedPref.ReturnShared();
    final String userId= auto.getString("User_Id");
    if(userId!=null){
      setState(() {
        LoginconUserId.text=userId;
      });
      return;
    }
  }
  Future<Null> logout() async {
    SharedPreferences auto= await SharedPref.ReturnShared();
    auto.setString("User_Id", null);

    setState(() {
      LoginconUserId.text=null;
      isLoggedIn = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body:// LoginScreen()
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginSignupHeader("Login"),
                getTextFormField(
                  controller:LoginconUserId,
                  icon: Icons.person,
                  hintName: "User ID",
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller:LoginconPassword,
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
                    onPressed: loginfunction,
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
                          Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpScreen()));
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
    );
  }
}

