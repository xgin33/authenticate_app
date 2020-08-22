import 'package:authenticate_app/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'other.dart';

class Home extends StatelessWidget {

  // Instantiate your class using Get.put() to make it available for all "child" routes there.
  final Controller c = Get.put(Controller());

  @override
  Widget build(context) => Scaffold(
    // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text("Flutter Demo Home Page")),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Obx(() => Text(c.count.string)),
          RaisedButton(child: Text("Go to Other"), onPressed: () => Get.to(Other()))
        ],
      ),



      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
}
