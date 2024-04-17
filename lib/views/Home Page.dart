import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emicalculator/Ad%20Controller/Google_Ads.dart';
import 'package:emicalculator/Media_Qury/Media.dart';
import 'package:emicalculator/controller/homeController.dart';
import 'package:emicalculator/views/calculator/EMI.dart';
import 'package:emicalculator/views/cash%20counter/Cash_Counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_settings/open_settings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Ad Controller/Tap Controller.dart';
import '../coman/widget controller.dart';
import 'calculator/GST.dart';
import 'calculator/SIP.dart';
import 'dart:developer' as developer;

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => con.onWillPop(context),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Calculator',
                style: GoogleFonts.karla(
                    fontSize: ScreenSize.horizontalBlockSize! * 7)),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    controllercontainer.getcontain(() {
                      controller.showbuttonad(
                          context, '/EMI_Calculator', '/Home_Page', '');
                    }, 'asset/image/SIP Calculator.png', "EMI"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllercontainer.getcontain(() {
                      controller.showbuttonad(
                          context, '/GST_Calculator', '/Home_Page', '');
                    }, 'asset/image/EMI Calculator.png', "GST"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllercontainer.getcontain(() {
                      controller.showbuttonad(
                          context, '/SIP_Calculator', '/Home_Page', '');
                    }, 'asset/image/GST Calculator.png', "SIP"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllercontainer.getcontain(() {
                      controller.showbuttonad(
                          context, '/EMI_in_Advance', '/Home_Page', '');
                    }, 'asset/image/Group 32.png', "EMI in Advance"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllercontainer.getcontain(() {
                      controller.showbuttonad(
                          context, '/Interest_Rate', '/Home_Page', '');
                    }, 'asset/image/interest-tax-2793424-2316821.webp',
                        "Interest Rate"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllercontainer.getcontain(() {
                      controller.showbuttonad(
                          context, '/CompareLoanScreen', '/Home_Page', '');
                    }, 'asset/image/compare loan icon.png', "Compare Loan"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllercontainer.getcontain(() {
                      controller.showbuttonad(
                          context, '/Loan_Period', '/Home_Page', '');
                    }, 'asset/image/icons8-loan-48.png', "Loan Period"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllercontainer.getcontain(() {
                      controller.showbuttonad(
                          context, '/Cash_Counter', '/Home_Page', '');
                    }, 'asset/image/cash.png', "Cash Counter"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllercontainer.getcontain(() {
                      con.launchATMUrl('Near Banks');
                    }, 'asset/image/Bank Info.png', "Near By Bank"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllercontainer.getcontain(() {
                      con.launchATMUrl('Near ATM');
                    }, 'asset/image/Near By Me.png', "Near By ATM"),
                    SizedBox(height: ScreenSize.fSize_80()),
                  ],
                ),
              ),
              banner.getBN('/Home_Page'),
            ],
          )),
    );
  }


}
