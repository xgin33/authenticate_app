import 'package:authenticate_app/controllers/controllers.dart';
import 'package:authenticate_app/ui/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Root extends GetWidget<AuthenticatorController> {
  @override
  Widget build(BuildContext context) {
    return GetX(

      initState: (_) async {
        Get.put<UserController>(UserController());
      },

      builder: (_) {
        String userUid = Get.find<AuthenticatorController>().user?.uid;
        print('User is ' + userUid);
        return Home();
      },
    );
  }
}