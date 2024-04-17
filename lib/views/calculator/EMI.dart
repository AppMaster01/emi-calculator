// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:math';

import 'package:emicalculator/Ad%20Controller/Back%20controller.dart';
import 'package:emicalculator/Ad%20Controller/Google_Ads.dart';
import 'package:emicalculator/controller/emiController.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../Media_Qury/Media.dart';
import '../../coman/widget controller.dart';

class EMI_Calculator extends StatefulWidget {
  const EMI_Calculator({super.key});

  @override
  State<EMI_Calculator> createState() => _EMI_CalculatorState();
}

class _EMI_CalculatorState extends State<EMI_Calculator> {
  final con = Get.put(EmiController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/EMI_Calculator', ''),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text('EMI Calculator',
                style: GoogleFonts.karla(
                    fontSize: ScreenSize.horizontalBlockSize! * 7)),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
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
                                //=========================================================================================================Texfiled=============================================
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 2)
                                        ]),
                                    child: Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        controllerfiled.gettextfiled(
                                            double.infinity,
                                            con.Principal.value,
                                            "Principal Amount",
                                            TextInputType.number),
                                        SizedBox(height: ScreenSize.fSize_12()),
                                        controllerfiled.gettextfiled(
                                            double.infinity,
                                            con.Rate.value,
                                            "Rate of Interest (p.a)",
                                            TextInputType.number),
                                        SizedBox(height: ScreenSize.fSize_15()),
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: ScreenSize.fSize_18()),
                                            controllerTextlibra.getPiker(
                                              "Tenure*",
                                              0xff000000,
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
                                              child:
                                                  controllerfiled.gettextfiled(
                                                      double.infinity,
                                                      con.MONTH.value,
                                                      "Months",
                                                      TextInputType.number),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: ScreenSize
                                                        .horizontalBlockSize! *
                                                    45,
                                              ),
                                              child:
                                                  controllerfiled.gettextfiled(
                                                      double.infinity,
                                                      con.YEAR.value,
                                                      "Year",
                                                      TextInputType.number),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: ScreenSize.fSize_20()),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                //=========================================================================================================Rest Compare Button=============================================

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        con.REST.value = true;
                                        con.Calculate.value = false;
                                        con.Principal.value.clear();
                                        con.Rate.value.clear();
                                        con.YEAR.value.clear();
                                        con.MONTH.value.clear();
                                        con.Load.value = false;
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                      },
                                      child: Container(
                                        width: ScreenSize.horizontalBlockSize! *
                                            37,
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                12,
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
                                        con.REST.value = false;
                                        con.Calculate.value = true;
                                        if (con.Principal.value.text.isEmpty ||
                                            con.Rate.value.text.isEmpty) {
                                          showToast();
                                        } else if (con.Principal.value.text
                                                .isNotEmpty ||
                                            con.Rate.value.text.isNotEmpty) {
                                          con.buildUser();
                                          con.Load.value = true;
                                        }
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                      },
                                      child: Container(
                                        width: ScreenSize.horizontalBlockSize! *
                                            37,
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                12,
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
                                //=========================================================================================================Total=============================================
                                SizedBox(
                                    height:
                                        ScreenSize.horizontalBlockSize! * 5),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: controllerContainer.getPiker(
                                      double.infinity,
                                      5,
                                      Column(
                                        children: [
                                          SizedBox(
                                              height: ScreenSize
                                                      .horizontalBlockSize! *
                                                  7),
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      7.5),
                                              controllercaltext.getText(
                                                  "Monthly EMI",
                                                  '${con.Load.value == true ? con.numberFormat.format(con.emiresult.value.round()) : "00"}'),
                                            ],
                                          ),
                                          SizedBox(
                                              height: ScreenSize
                                                      .horizontalBlockSize! *
                                                  3),
                                          controllerdivider.getText(),
                                          SizedBox(
                                              height: ScreenSize
                                                      .horizontalBlockSize! *
                                                  3),
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      7.5),
                                              controllercaltext.getText(
                                                  "Total Interest",
                                                  '${con.Load.value == true ? con.numberFormat.format(con.TotalInterst.value.round()) : "00"}'),
                                            ],
                                          ),
                                          SizedBox(
                                              height: ScreenSize
                                                      .horizontalBlockSize! *
                                                  3),
                                          controllerdivider.getText(),
                                          SizedBox(
                                              height: ScreenSize
                                                      .horizontalBlockSize! *
                                                  3),
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      7.5),
                                              controllercaltext.getText(
                                                  "Total Payment",
                                                  '${con.Load.value == true ? con.numberFormat.format(con.TotalPayment.value.round()) : "00"}'),
                                            ],
                                          ),
                                          SizedBox(
                                              height: ScreenSize
                                                      .horizontalBlockSize! *
                                                  7),
                                        ],
                                      )),
                                ),
                                Center(
                                  child: IconButton(
                                      onPressed: () => Share.share(
                                            "Monthly EMI: ${con.numberFormat.format(con.emiresult.value.round())}\n"
                                            "Total Interest: ${con.numberFormat.format(con.emiresult.value.round())}\n"
                                            "Total Payment: ${con.numberFormat.format(con.TotalPayment.value.round())}",
                                          ),
                                      icon: Icon(Icons.share_rounded)),
                                ),
                                SizedBox(
                                  height: ScreenSize.fSize_80(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              banner.getBN('/EMI_Calculator')
            ],
          )),
    );
  }
}
