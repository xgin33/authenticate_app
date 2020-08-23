import 'package:authenticate_app/controllers/authenticatorController.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SignUp extends GetWidget<AuthenticatorController> {
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Last Name"),
                controller: lastNameController,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "First Name"),
                controller: firstNameController,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                controller: passwordController,
              ),
              FlatButton(
                child: Text("Sign Up"),
                onPressed: () {
                  controller.createUser(firstNameController.text,lastNameController.text,
                      emailController.text, passwordController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}