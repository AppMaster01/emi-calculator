// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:math';

import 'package:emicalculator/Ad%20Controller/Back%20controller.dart';
import 'package:emicalculator/Ad%20Controller/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../Media_Qury/Media.dart';
import '../../coman/widget controller.dart';

class SIP_Calculator extends StatefulWidget {
  const SIP_Calculator({super.key});

  @override
  State<SIP_Calculator> createState() => _SIP_CalculatorState();
}

class _SIP_CalculatorState extends State<SIP_Calculator> {
  final Principal = TextEditingController().obs;
  final Rate = TextEditingController().obs;
  final YEAR = TextEditingController().obs;
  final MONTH = TextEditingController().obs;
  var REST = false.obs;
  var Calculate = false.obs;
  var investment = 0.0.obs;
  var interest = 0.0.obs;
  var sip = 0.0.obs;
  var load = false.obs;

  var abc = Get.arguments;

  showToast() {
    Fluttertoast.showToast(
      msg: "Empty",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 3,
      textColor: Colors.white,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.red,
      fontSize: ScreenSize.fSize_18(),
    );
  }

  final numberFormat = NumberFormat("##,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/SIP_Calculator', ''),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text('SIP Calculator',
              style: GoogleFonts.karla(
                  fontSize: ScreenSize.horizontalBlockSize! * 7)),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode()); //remove focus
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Obx(
                  () => Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //=========================================================================================================TextFiled=============================================

                          Padding(
                              padding: const EdgeInsets.all(12),
                              child: controllerContainer.getPiker(
                                  double.infinity,
                                  6,
                                  Column(
                                    children: [
                                      SizedBox(height: ScreenSize.fSize_20()),
                                      controllerfiled.gettextfiled(
                                          double.infinity,
                                          Principal.value,
                                          "Regular Monthly Deposit",
                                          TextInputType.number),
                                      SizedBox(height: ScreenSize.fSize_12()),
                                      controllerfiled.gettextfiled(
                                          double.infinity,
                                          Rate.value,
                                          "Rate of Interest",
                                          TextInputType.number),
                                      SizedBox(height: ScreenSize.fSize_15()),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: ScreenSize.fSize_18()),
                                          controllerTextlibra.getPiker(
                                            "Tenure*",
                                            0xFF000000,
                                            FontWeight.w500,
                                            ScreenSize.horizontalBlockSize! *
                                                1.5,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: ScreenSize.fSize_15()),
                                      Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: ScreenSize
                                                        .horizontalBlockSize! *
                                                    45),
                                            child: controllerfiled.gettextfiled(
                                                double.infinity,
                                                MONTH.value,
                                                "Months",
                                                TextInputType.number),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: ScreenSize
                                                      .horizontalBlockSize! *
                                                  45,
                                            ),
                                            child: controllerfiled.gettextfiled(
                                                double.infinity,
                                                YEAR.value,
                                                "Year",
                                                TextInputType.number),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: ScreenSize.fSize_20()),
                                    ],
                                  ))),
                          SizedBox(height: ScreenSize.fSize_10()),
                          //=========================================================================================================Rest Calculat Button=============================================

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  REST.value = true;
                                  Calculate.value = false;
                                  Principal.value.clear();
                                  Rate.value.clear();
                                  YEAR.value.clear();
                                  MONTH.value.clear();
                                  load.value = false;
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode()); //remove focus
                                },
                                child: Container(
                                  width: ScreenSize.horizontalBlockSize! * 37,
                                  height: ScreenSize.horizontalBlockSize! * 12,
                                  decoration: BoxDecoration(
                                      color: Color(0xff55887c),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: controllerTextlibra.getPiker('Reset',
                                        0xffffffff, FontWeight.w500, 4.5),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  REST.value = false;
                                  Calculate.value = true;
                                  if (Principal.value.text.isEmpty ||
                                      Rate.value.text.isEmpty) {
                                    showToast();
                                  } else if (Principal.value.text.isNotEmpty ||
                                      Rate.value.text.isNotEmpty) {
                                    load.value = true;
                                    calculation();
                                  }
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode()); //remove focus
                                },
                                child: Container(
                                  width: ScreenSize.horizontalBlockSize! * 37,
                                  height: ScreenSize.horizontalBlockSize! * 12,
                                  decoration: BoxDecoration(
                                      color: Color(0xff55887c),
                                      borderRadius: BorderRadius.circular(10)),
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
                          SizedBox(height: ScreenSize.horizontalBlockSize! * 5),
                          //=========================================================================================================Total=============================================
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
                                            "Investment Amount",
                                            '${load.value == true ? numberFormat.format(investment.value.round()) : "00"}')
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
                                            '${load.value == true ? numberFormat.format(interest.value.round()) : "00"}'),
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
                                            "SIP Maturity Amount",
                                            '${load.value == true ? numberFormat.format(sip.value.round()) : "00"}'),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                7),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: ScreenSize.fSize_80(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              banner.getBN('/SIP_Calculator')
            ],
          ),
        ),
      ),
    );
  }

  calculation() {
    int A = int.parse(Principal.value.text);
    double R = double.parse(Rate.value.text) / 12 / 100;
    int Y = int.parse(YEAR.value.text) * 12 + int.parse(MONTH.value.text);
    var IA = A * ((pow((1 + R), (Y)) - 1) / R) * (1 + R);
    investment.value = 0.0.obs.value = double.parse((A * Y).toString());
    interest.value = IA - investment.value;
    sip.value = 0.0.obs.value = investment.value + interest.value;
  }
}
