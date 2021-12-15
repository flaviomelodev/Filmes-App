import 'package:filme_app/views/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const AppWidget(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    ),
  );
}
