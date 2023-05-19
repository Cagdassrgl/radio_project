import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radio_project/view/home/home_page.dart';
import 'package:radio_project/view/radio/view/radio_page.dart';
import 'package:radio_project/view/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(828, 1792),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Radio App',
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashPage(),
              '/home': (context) => HomePage(),
              '/radio': (context) => RadioPage(),
            },
          ),
        );
      },
    );
  }
}
