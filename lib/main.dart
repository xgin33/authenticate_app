import 'package:authenticate_app/utils/root.dart';

import 'controllers/bindings/authBinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()  async {


  runApp(
      GetMaterialApp( initialBinding: AuthBinding(),
                      debugShowCheckedModeBanner:false,

                      home: Root(),));
}

