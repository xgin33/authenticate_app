import 'package:authenticate_app/controllers/controllers.dart';
import 'package:authenticate_app/services/database.dart';
import 'package:authenticate_app/ui/views/connection/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarConnection  extends GetWidget<AuthenticatorController> implements PreferredSizeWidget {
  final String title;
  final String firstName;

   AppBarConnection({
    Key key,
    @required this.title,
     @required this.firstName
  });


  @override
  Widget build(BuildContext context) {
    String userUid = Get.find<AuthenticatorController>().user?.uid;
    if(userUid != null)
    {
      return appBarConnected(userUid);
    }
    else {
      return appBarNotConnected();
    }

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
  Widget appBarConnected(String userUid)
  {
    return AppBar(title: Text(title), actions: <Widget>[
      GetX<UserController>(

        initState: (_) async {
          Get.find<UserController>().user =
          await Database().getUser(userUid);
        },
        builder: (_) {
          if (_.user.firstName != null) {
            return Center(
                child: Text( _.user.firstName)
            );
          } else {
            return Center( child:Text("loading..."));
          }
        },
      ),
      IconButton(
        icon: Icon(Icons.exit_to_app),
        onPressed: () {
          controller.signOut();
        },
      ),
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight( AppBar().preferredSize.height);




}