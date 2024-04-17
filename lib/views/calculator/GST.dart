// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:emicalculator/Ad%20Controller/Back%20controller.dart';
import 'package:emicalculator/Ad%20Controller/Google_Ads.dart';
import 'package:emicalculator/controller/gstController.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../Media_Qury/Media.dart';
import '../../coman/widget controller.dart';

class GST_Calculator extends StatefulWidget {
  const GST_Calculator({super.key});

  @override
  State<GST_Calculator> createState() => _GST_CalculatorState();
}

class _GST_CalculatorState extends State<GST_Calculator> {
  final con = Get.put(GstController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/GST_Calculator', ''),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text('GST Calculator',
              style: GoogleFonts.karla(
                  fontSize: ScreenSize.horizontalBlockSize! * 7)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Obx(
                  () => Column(
                    children: [
                      SizedBox(height: ScreenSize.fSize_15()),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: controllerContainer.getPiker(
                            double.infinity,
                            5,
                            Column(
                              children: [
                                //=========================================================================================================TextFiled=============================================

                                SizedBox(height: ScreenSize.fSize_20()),
                                Row(
                                  children: [
                                    SizedBox(width: ScreenSize.fSize_18()),
                                    controllerTextlibra.getPiker("Amount*",
                                        0xff000000, FontWeight.w500, 5.2),
                                  ],
                                ),
                                SizedBox(height: ScreenSize.fSize_10()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right:
                                          ScreenSize.horizontalBlockSize! * 1,
                                      left:
                                          ScreenSize.horizontalBlockSize! * 1),
                                  child: controllerfiled.gettextfiled(
                                      double.infinity,
                                      con.Principal.value,
                                      "Original Amount",
                                      TextInputType.number),
                                ),
                                SizedBox(height: ScreenSize.fSize_15()),
                                Row(
                                  children: [
                                    SizedBox(width: ScreenSize.fSize_18()),
                                    controllerTextlibra.getPiker("GST Rate*",
                                        0xff000000, FontWeight.w500, 5.2),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: ScreenSize.fSize_15()),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        controllerradio.getPiker(() {
                                          con.ONE.value = true;
                                          con.TWO.value = false;
                                          con.THREE.value = false;
                                          con.FOR.value = false;
                                          con.FIVE.value = false;
                                          con.SIX.value = false;
                                          con.Rate.value = 2;
                                          con.load.value = true;
                                        },
                                            con.ONE.value == true
                                                ? const Color(0xff55887c)
                                                : Colors.transparent,
                                            ScreenSize.fSize_50(),
                                            "2%",
                                            ScreenSize.fSize_8()),
                                        //=======================================================================================
                                        controllerradio.getPiker(() {
                                          con.ONE.value = false;
                                          con.TWO.value = true;
                                          con.THREE.value = false;
                                          con.FOR.value = false;
                                          con.FIVE.value = false;
                                          con.SIX.value = false;
                                          con.Rate.value = 5;
                                          con.load.value = true;
                                        },
                                            con.TWO.value == true
                                                ? const Color(0xff55887c)
                                                : Colors.transparent,
                                            ScreenSize.fSize_50(),
                                            "5%",
                                            ScreenSize.fSize_8()),
                                        //=======================================================================================
                                        controllerradio.getPiker(() {
                                          con.ONE.value = false;
                                          con.TWO.value = false;
                                          con.THREE.value = true;
                                          con.FOR.value = false;
                                          con.FIVE.value = false;
                                          con.SIX.value = false;
                                          con.Rate.value = 12;
                                          con.load.value = true;
                                        },
                                            con.THREE.value == true
                                                ? const Color(0xff55887c)
                                                : Colors.transparent,
                                            ScreenSize.fSize_50(),
                                            "12%",
                                            ScreenSize.fSize_8()),
                                      ],
                                    ),
                                    SizedBox(height: ScreenSize.fSize_15()),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        controllerradio.getPiker(() {
                                          con.ONE.value = false;
                                          con.TWO.value = false;
                                          con.THREE.value = false;
                                          con.FOR.value = true;
                                          con.FIVE.value = false;
                                          con.SIX.value = false;
                                          con.Rate.value = 18;
                                          con.load.value = true;
                                        },
                                            con.FOR.value == true
                                                ? const Color(0xff55887c)
                                                : Colors.transparent,
                                            ScreenSize.fSize_50(),
                                            "18%",
                                            ScreenSize.fSize_8()),
                                        //=======================================================================================
                                        controllerradio.getPiker(() {
                                          con.ONE.value = false;
                                          con.TWO.value = false;
                                          con.THREE.value = false;
                                          con.FOR.value = false;
                                          con.FIVE.value = true;
                                          con.SIX.value = false;
                                          con.Rate.value = 28;
                                          con.load.value = true;
                                        },
                                            con.FIVE.value == true
                                                ? const Color(0xff55887c)
                                                : Colors.transparent,
                                            ScreenSize.fSize_50(),
                                            "28%",
                                            ScreenSize.fSize_8()),
                                        //=======================================================================================
                                        controllerradio.getPiker(() {
                                          con.ONE.value = false;
                                          con.TWO.value = false;
                                          con.THREE.value = false;
                                          con.FOR.value = false;
                                          con.FIVE.value = false;
                                          con.SIX.value = true;
                                          con.Rate.value = 0;
                                          con.load.value = true;
                                        },
                                            con.SIX.value == true
                                                ? const Color(0xff55887c)
                                                : Colors.transparent,
                                            ScreenSize.fSize_50(),
                                            "Other",
                                            ScreenSize.fSize_8()),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: ScreenSize.fSize_30()),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    controllerGst.getPiker(() {
                                      con.id.value = 1;
                                      con.ADD.value = true;
                                      con.REMOVE.value = false;
                                    },
                                        con.ADD.value == true
                                            ? const Color(0xFF000000)
                                            : const Color(0xFF000000)
                                                .withOpacity(0.5),
                                        "Add GST",
                                        con.ADD.value == true
                                            ? const Color(0xFF000000)
                                            : const Color(0xFF000000)
                                                .withOpacity(0.5),
                                        con.ADD.value == true
                                            ? 0xFF000000
                                            : 0xFF93969F),
                                    controllerGst.getPiker(() {
                                      con.id.value = 2;
                                      con.REMOVE.value = true;
                                      con.ADD.value = false;
                                    },
                                        con.REMOVE.value == true
                                            ? const Color(0xFF000000)
                                            : const Color(0xFF000000)
                                                .withOpacity(0.5),
                                        "Remove GST",
                                        con.REMOVE.value == true
                                            ? const Color(0xFF000000)
                                            : const Color(0xFF000000)
                                                .withOpacity(0.5),
                                        con.REMOVE.value == true
                                            ? 0xFF000000
                                            : 0xFF93969F),
                                  ],
                                ),
                                SizedBox(height: ScreenSize.fSize_20()),
                              ],
                            )),
                      ),
                      SizedBox(height: ScreenSize.fSize_15()),
                      //=========================================================================================================Rest Calculat Button=============================================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              con.REST.value = true;
                              con.Calculate.value = false;
                              con.Principal.value.clear();
                              con.load.value = false;
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                            child: Container(
                              width: ScreenSize.horizontalBlockSize! * 37,
                              height: ScreenSize.horizontalBlockSize! * 12,
                              decoration: BoxDecoration(
                                  color: Color(0xff55887c),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: controllerTextlibra.getPiker(
                                    'Reset', 0xffffffff, FontWeight.w500, 4.5),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              con.REST.value = false;
                              con.Calculate.value = true;
                              if (con.Principal.value.text.isEmpty) {
                                showToast();
                              } else if (con.Principal.value.text.isNotEmpty) {
                                con.calculation();
                                con.load.value = true;
                              }
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                            child: Container(
                              width: ScreenSize.horizontalBlockSize! * 37,
                              height: ScreenSize.horizontalBlockSize! * 12,
                              decoration: BoxDecoration(
                                  color: Color(0xff55887c),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: controllerTextlibra.getPiker('Calculate',
                                    0xffffffff, FontWeight.w500, 4.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenSize.fSize_15()),
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
                                        ScreenSize.horizontalBlockSize! * 7),
                                Row(
                                  children: [
                                    SizedBox(
                                        width: ScreenSize.horizontalBlockSize! *
                                            7.5),
                                    controllercaltext.getText("GST Price",
                                        '${con.load.value == true ? con.numberFormat.format(con.GST.value.round()) : "00"}'),
                                  ],
                                ),
                                SizedBox(
                                    height:
                                        ScreenSize.horizontalBlockSize! * 3),
                                controllerdivider.getText(),
                                SizedBox(
                                    height:
                                        ScreenSize.horizontalBlockSize! * 3),
                                Row(
                                  children: [
                                    SizedBox(
                                        width: ScreenSize.horizontalBlockSize! *
                                            7.5),
                                    controllercaltext.getText("Original Price",
                                        '${con.load.value == true ? con.numberFormat.format(con.Original.value.round()) : "00"}'),
                                  ],
                                ),
                                SizedBox(
                                    height:
                                        ScreenSize.horizontalBlockSize! * 3),
                                controllerdivider.getText(),
                                SizedBox(
                                    height:
                                        ScreenSize.horizontalBlockSize! * 3),
                                Row(
                                  children: [
                                    SizedBox(
                                        width: ScreenSize.horizontalBlockSize! *
                                            7.5),
                                    controllercaltext.getText("Net Price",
                                        '${con.load.value == true ? con.numberFormat.format(con.Net.value.round()) : "00"}'),
                                  ],
                                ),
                                SizedBox(
                                    height:
                                        ScreenSize.horizontalBlockSize! * 7),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: ScreenSize.fSize_80(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            banner.getBN('/GST_Calculator')
          ],
        ),
      ),
    );
  }
}
