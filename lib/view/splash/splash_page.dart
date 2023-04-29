import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_project/core/constant/app_assets/app_assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/home'),
    );
    return Image.asset(
      AppAssets.RADIO_GIF,
      fit: BoxFit.fill,
    );
  }
}
