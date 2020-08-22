import 'package:authenticate_app/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarConnection extends AppBar {
  AppBarConnection(String title)
      : super(
      flexibleSpace: AppBar(title: Text(title), actions: <Widget>[
        IconButton(
            icon: new Icon(Icons.account_box),
            onPressed: () => Get.to(Login())),
      ]));

}