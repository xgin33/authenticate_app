

import 'package:authenticate_app/ui/views/connection/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarConnection  extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarConnection({
    Key key,
    @required this.title,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return appBarNotConnected();

  }

  // Not connected
  Widget appBarNotConnected()
  {
    return AppBar(title: Text(title), actions: <Widget>[
      IconButton(
          icon: new Icon(Icons.account_box),
          onPressed: () => Get.to(Login())),
    ]);
  }

  // User is connected
  Widget appBarConnected(String firstName)
  {
    return AppBar(title: Text(title), actions: <Widget>[
      IconButton(
          icon: new Icon(Icons.account_box),
          onPressed: () => Get.to(Login())),
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight( AppBar().preferredSize.height);




}