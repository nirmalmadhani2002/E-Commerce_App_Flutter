import 'package:e_commerce_app_flutter/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CartPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      getPages: [
        GetPage(name: '/', page: ()=> HomePage()),
       GetPage(name: '/cart_page', page: ()=> CartPage()),
      ],
    );
  }
}
