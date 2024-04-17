import 'dart:developer';

import 'package:emicalculator/Ad%20Controller/Back%20controller.dart';
import 'package:emicalculator/Ad%20Controller/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../Media_Qury/Media.dart';
import '../../coman/widget controller.dart';

class Interest_Rate extends StatefulWidget {
  const Interest_Rate({Key? key}) : super(key: key);

  @override
  State<Interest_Rate> createState() => _Interest_RateState();
}

class _Interest_RateState extends State<Interest_Rate> {
  var amountController = TextEditingController().obs;
  var emiController = TextEditingController().obs;
  var yearController = TextEditingController().obs;
  var monthController = TextEditingController().obs;

  var monthlyemi = 00.obs;
  var totalpayment = 00.obs;
  var totalinterest = 00.obs;
  var interest = 0.0.obs;
  var Duration;

  var load = false.obs;

  var arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Interest_Rate', ''),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text('Interest Rate',
              style: GoogleFonts.karla(
                  fontSize: ScreenSize.horizontalBlockSize! * 7)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Container(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: ScreenSize.fSize_10()),
                            controllerfiled.gettextfiled(
                                double.infinity,
                                amountController.value,
                                "Principal Amount",
                                TextInputType.number),
                            SizedBox(height: ScreenSize.fSize_10()),
                            controllerfiled.gettextfiled(
                                double.infinity,
                                emiController.value,
                                "Principal Amount",
                                TextInputType.number),
                            SizedBox(height: ScreenSize.fSize_10()),
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left:
                                          ScreenSize.horizontalBlockSize! * 45),
                                  child: controllerfiled.gettextfiled(
                                      double.infinity,
                                      monthController.value,
                                      "Months",
                                      TextInputType.number),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: ScreenSize.horizontalBlockSize! * 45,
                                  ),
                                  child: controllerfiled.gettextfiled(
                                      double.infinity,
                                      yearController.value,
                                      "Year",
                                      TextInputType.number),
                                ),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_30()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    emiController.value.clear();
                                    amountController.value.clear();
                                    yearController.value.clear();
                                    monthController.value.clear();
                                  },
                                  child: Container(
                                    width: ScreenSize.horizontalBlockSize! * 37,
                                    height:
                                        ScreenSize.horizontalBlockSize! * 12,
                                    decoration: BoxDecoration(
                                        color: Color(0xff55887c),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: controllerTextlibra.getPiker(
                                          'Reset',
                                          0xffffffff,
                                          FontWeight.w500,
                                          4.5),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    load.value = true;
                                    var aaa = int.parse(
                                        amountController.value.value.text);
                                    calculation();
                                  },
                                  child: Container(
                                    width: ScreenSize.horizontalBlockSize! * 37,
                                    height:
                                        ScreenSize.horizontalBlockSize! * 12,
                                    decoration: BoxDecoration(
                                        color: Color(0xff55887c),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: controllerTextlibra.getPiker(
                                          'Calculate',
                                          0xffffffff,
                                          FontWeight.w500,
                                          4.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: ScreenSize.fSize_30()),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: controllerContainer.getPiker(
                                  double.infinity,
                                  5,
                                  Column(
                                    children: [
                                      SizedBox(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  7),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: ScreenSize
                                                      .horizontalBlockSize! *
                                                  7.5),
                                          controllercaltext.getText(
                                              "Monthly EMI",
                                              '${load.value == true ? emiController.value.text : "00"}'),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  3),
                                      controllerdivider.getText(),
                                      SizedBox(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  3),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: ScreenSize
                                                      .horizontalBlockSize! *
                                                  7.5),
                                          controllercaltext.getText(
                                              "Total Interest",
                                              '${load.value == true ? totalinterest.toString() : "00"}'),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  3),
                                      controllerdivider.getText(),
                                      SizedBox(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  3),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: ScreenSize
                                                      .horizontalBlockSize! *
                                                  7.5),
                                          controllercaltext.getText(
                                              "Total Payment",
                                              '${load.value == true ? totalpayment.value.toString() : "00"}'),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  3),
                                      controllerdivider.getText(),
                                      SizedBox(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  3),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: ScreenSize
                                                      .horizontalBlockSize! *
                                                  7.5),
                                          controllercaltext.getText("Interest",
                                              '${load.value == true ? interest.value.toStringAsFixed(2) : "00"}'),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  7),
                                    ],
                                  )),
                            ),
                            SizedBox(height: ScreenSize.fSize_80()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN('/Interest_Rate')
          ],
        ),
      ),
    );
  }

  calculation() {
    int P = int.parse(amountController.value.text);
    int EMI = int.parse(emiController.value.text);
    int Y = int.parse(yearController.value.text);
    int M = int.parse(monthController.value.text);
    int Period = Y * 12 + M;
    double Year = Period / 12;
    log("Yearrrrr:--------------- $Year");

    monthlyemi.value = EMI;
    Duration = Period;
    totalpayment.value = EMI * Period;
    totalinterest.value = totalpayment.value - P;
    var Interest = (1 / Year) * ((totalpayment / P) - 1);
    interest.value = Interest * 100;
    // var Interest2 = interest / P * Year;
    // var Interest3 = Interest2 * 100 * 12;
  }
}
