
import 'package:authenticate_app/ui/widgets/appbar_connection.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {



  @override
  Widget build(context) {


    return Scaffold(


      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBarConnection(title:"Flutter Demo Home Page"),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),


      ),
    );
  }
}