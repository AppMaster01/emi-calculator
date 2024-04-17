import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Media_Qury/Media.dart';
import '../My_Controller.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  MyAppController myAppController = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
        body: Center(
      child: SizedBox(
        height: ScreenSize.horizontalBlockSize! * 40,
        child: Image(
            image: AssetImage(
                'asset/image/Ad8iLFY6PxVYdLmwj0fn5-transformed.png')),
      ),
    ));
  }
}
