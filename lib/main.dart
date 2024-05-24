import 'package:chatapp/constants/strings.dart';
import 'package:chatapp/features/screens/home_screen.dart';
import 'package:chatapp/features/screens/onboardingscreen.dart';
import 'package:chatapp/features/widgets/sidescroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        fontFamily: "lato",
      ),
      home: const HomeScreen(),
    );
  }
}
