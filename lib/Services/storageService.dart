import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  setItem(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future getItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key);
    return value;
  }

  deleteItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}


class SharedPrefc {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
