import 'package:authenticate_app/controllers/controllers.dart';
import 'package:authenticate_app/firebase/dao/user_dao.dart';
import 'package:authenticate_app/ui/views/connection/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends GetWidget<AuthenticatorController> {
  final String userUid = Get.find<AuthenticatorController>().user?.uid;

  ///Header Part
  Widget _createHeader() {
    if (userUid != null) {
      return _createHeaderConnected();
    } else {
      return _createHeaderNotConnected();
    }
  }

  Widget _createHeaderNotConnected() {
    return Container(
        height: 90,
        child: DrawerHeader(
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
            child: Row(children: [
              Container(
                width: 5.0,
              ),
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    Get.to(Login());
                  }),
              Container(
                width: 5.0,
              ),
              new GestureDetector(
                  onTap: () {
                    Get.to(Login());
                  },
                  child: Text("Se connecter ou créer un compte")),
            ])));
  }

  /// HeaderConnected
  Widget _createHeaderConnected() {
    return Container(
        height: 90,
        child: DrawerHeader(
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(0.0),
          child: GetX<UserController>(
            initState: (_) async {
              Get.find<UserController>().user =
                  await UserDao().getUser(userUid);
            },
            builder: (_) {
              if (_.user.firstName != null) {
                return Row(children: [
                  Container(
                    width: 5.0,
                  ),
                  CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey,
                        child: Text(_.user.initial()),
                      )),
                  Container(
                    width: 5.0,
                  ),
                  Center(
                    child: Text(_.user.fullName(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500)),
                  )
                ]);
              } else {
                return Center(child: Text("loading..."));
              }
            },
          ),
        ));
  }

  /// Item part
  Widget _createDrawerItemElement(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createDrawerItem() {
    if (userUid != null) {
      return _createDrawerItemElement(
          icon: Icons.exit_to_app,
          text: 'Déconnexion',
          onTap: () => controller.signOut());
    } else
      return Text("");
  }

  /// Drawer
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(),
          Divider(),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
