
import 'package:authenticate_app/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context){

    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: Text("Connection"),),
        body: Center(child: Text(c.count.string)));
  }
}