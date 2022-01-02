
import 'package:flutter/material.dart';

class LoginSignupHeader extends StatelessWidget {
String HeaderName;
LoginSignupHeader(this.HeaderName);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height:50.0 ,
          ),
          Text(
            HeaderName,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          SizedBox(height: 10.0),
          Image.asset("Images/splash_Logo.png",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(height: 10.0),
          Text(" NewsPaper TutApp",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black38,
              fontSize: 25.0
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
