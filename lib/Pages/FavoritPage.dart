import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Pages/FavoritDetails.dart';
import 'package:mvvm_buildrealproject/Services/Webservices.dart';

class FavoritPage extends StatefulWidget {

  @override
  FavoritPageState createState() => FavoritPageState();
}

class FavoritPageState extends State<FavoritPage> {
  final _formKey = new GlobalKey<FormState>();
  var db;
 /* @override
  void initState() {
    super.initState();
    db= API_Database;
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Saved Articles"),
      ),
      body: Form(
        key: _formKey,
        child:FavoritDetails(),

      )
    );
  }
}
