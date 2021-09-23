import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase_1/mainpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        title: "FAM CRUD Firestore 1",
        home: MainPage(),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
