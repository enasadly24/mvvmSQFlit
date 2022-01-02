import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/DataBase/DbHelper.dart';
import 'package:mvvm_buildrealproject/Login_signup_Screens/SignUp.dart';
import 'package:mvvm_buildrealproject/Pages/FavoritPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final _controller = TextEditingController();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  DbHelper dbHelper;
  @override
  void initState() {
    // TODO: implement initState
    getUserData();
    super.initState();
    dbHelper= DbHelper();
  }
  final _conUserName = TextEditingController();
  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;
    setState(() {
      _conUserName.text = sp.getString("User_Name");
    });

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            leading: CircleAvatar(child: Icon(Icons.person),),
            title: Text('${_conUserName.text}'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.favorite,color: Colors.red,),
            title: Text("Favorites"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FavoritPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));

            },
          ),
        ],
      ),
    );
  }
}
