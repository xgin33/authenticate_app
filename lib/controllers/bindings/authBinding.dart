
import 'package:authenticate_app/controllers/authenticatorController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    Get.put<AuthenticatorController>(AuthenticatorController(), permanent: true);
  }
}