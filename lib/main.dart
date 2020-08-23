import 'package:authenticate_app/ui/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/controllers.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthenticatorController>(AuthenticatorController(), permanent: true);
  Get.put<UserController>(UserController());

  runApp(
      GetMaterialApp(
                      debugShowCheckedModeBanner:false,
                      home: Home(),));
}

