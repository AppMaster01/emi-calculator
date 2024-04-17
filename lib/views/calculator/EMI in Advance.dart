import 'dart:math';

import 'package:emicalculator/Ad%20Controller/Back%20controller.dart';
import 'package:emicalculator/Ad%20Controller/Google_Ads.dart';
import 'package:emicalculator/controller/emiAdvanceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Media_Qury/Media.dart';
import '../../coman/widget controller.dart';

class EMI_in_Advance extends StatefulWidget {
  const EMI_in_Advance({super.key});

  @override
  State<EMI_in_Advance> createState() => _EMI_in_AdvanceState();
}

class _EMI_in_AdvanceState extends State<EMI_in_Advance> {
  final con = Get.put(EmiAdvanceController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/EMI_in_Advance', ''),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text('EMI in Advance Calculator',
              style: GoogleFonts.karla(
                  fontSize: ScreenSize.horizontalBlockSize! * 5.5)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Obx(
              () => SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //=========================================================================================================Textfiled=============================================
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 2)
                            ]),
                        child: Column(
                          children: [
                            SizedBox(height: ScreenSize.fSize_10()),
                            controllerfiled.gettextfiled(
                                double.infinity,
                                con.principalController.value,
                                "Principal Amount",
                                TextInputType.number),
                            controllerfiled.gettextfiled(
                                double.infinity,
                                con.rateController.value,
                                "Rate of Interest (p.a)",
                                TextInputType.number),
                            controllerfiled.gettextfiled(
                                double.infinity,
                                con.feesController.value,
                                "FeesView",
                                TextInputType.number),
                            controllerfiled.gettextfiled(
                                double.infinity,
                                con.tenureController.value,
                                "Year",
                                TextInputType.number),
                            SizedBox(height: ScreenSize.fSize_20()),
                          ],
                        ),
                      ),
                    ),
                    //=========================================================================================================Radio Button=============================================

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1,
                          child: Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFF55887c)),
                            activeColor: const Color(0xFF55887c),
                            value: 1,
                            groupValue: con.id.value,
                            onChanged: (val) {
                              con.id.value = 1;
                            },
                          ),
                        ),
                        controllerTextlibra.getPiker(
                          "Years",
                          0xff000000,
                          FontWeight.w500,
                          ScreenSize.horizontalBlockSize! * 1.2,
                        ),
                        Transform.scale(
                          scale: 1,
                          child: Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFF55887c)),
                            activeColor: const Color(0xFF55887c),
                            value: 2,
                            groupValue: con.id.value,
                            onChanged: (val) {
                              con.id.value = 2;
                            },
                          ),
                        ),
                        controllerTextlibra.getPiker(
                          "Months",
                          0xff000000,
                          FontWeight.w500,
                          ScreenSize.horizontalBlockSize! * 1.2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1,
                          child: Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFF55887c)),
                            activeColor: const Color(0xFF55887c),
                            value: 1,
                            groupValue: con.id2.value,
                            onChanged: (val) {
                              con.id2.value = 1;
                            },
                          ),
                        ),
                        controllerTextlibra.getPiker(
                          "EMI in Arrears",
                          0xff000000,
                          FontWeight.w500,
                          ScreenSize.horizontalBlockSize! * 1.2,
                        ),
                        Transform.scale(
                          scale: 1,
                          child: Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFF55887c)),
                            activeColor: const Color(0xFF55887c),
                            value: 2,
                            groupValue: con.id2.value,
                            onChanged: (val) {
                              con.id2.value = 2;
                            },
                          ),
                        ),
                        controllerTextlibra.getPiker(
                          "EMI in Advance",
                          0xff000000,
                          FontWeight.w500,
                          ScreenSize.horizontalBlockSize! * 1.2,
                        ),
                      ],
                    ),
                    //=========================================================================================================Rest calculat Button=============================================

                    SizedBox(height: ScreenSize.fSize_10()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            con.principalController.value.clear();
                            con.rateController.value.clear();
                            con.feesController.value.clear();
                            con.tenureController.value.clear();
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
                            if (con.principalController.value.text.isEmpty ||
                                con.rateController.value.text.isEmpty ||
                                con.feesController.value.text.isEmpty ||
                                con.tenureController.value.text.isEmpty) {
                            } else {
                              con.load.value = true;
                              con.emiCalculation();
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
                                child: Text(
                              "Calculate",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.karla(
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      ScreenSize.horizontalBlockSize! * 4),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    //=========================================================================================================Total=============================================

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: controllerContainer.getPiker(
                          double.infinity,
                          5,
                          Column(
                            children: [
                              SizedBox(
                                  height: ScreenSize.horizontalBlockSize! * 7),
                              Row(
                                children: [
                                  SizedBox(
                                      width: ScreenSize.horizontalBlockSize! *
                                          7.5),
                                  controllercaltext.getText(
                                      "Monthly EMI",
                                      con.load.value == true
                                          ? con.Totalrate.value
                                          : "00"),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      ScreenSize.horizontalBlockSize! * 1.5),
                              controllerdivider.getText(),
                              SizedBox(
                                  height:
                                      ScreenSize.horizontalBlockSize! * 1.5),
                              Row(
                                children: [
                                  SizedBox(
                                      width: ScreenSize.horizontalBlockSize! *
                                          7.5),
                                  controllercaltext.getText(
                                      "Total Interest",
                                      con.load.value == true
                                          ? con.TotalPayment.value
                                          : "00"),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      ScreenSize.horizontalBlockSize! * 1.5),
                              controllerdivider.getText(),
                              SizedBox(
                                  height:
                                      ScreenSize.horizontalBlockSize! * 1.5),
                              Row(
                                children: [
                                  SizedBox(
                                      width: ScreenSize.horizontalBlockSize! *
                                          7.5),
                                  controllercaltext.getText(
                                      "Total Payment",
                                      con.load.value == true
                                          ? con.principalController.value.text
                                          : "00"),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      ScreenSize.horizontalBlockSize! * 1.5),
                              controllerdivider.getText(),
                              SizedBox(
                                  height:
                                      ScreenSize.horizontalBlockSize! * 1.5),
                              Row(
                                children: [
                                  SizedBox(
                                      width: ScreenSize.horizontalBlockSize! *
                                          7.5),
                                  controllercaltext.getText(
                                      "Total Payment",
                                      con.load.value == true
                                          ? con.Result.value
                                          : "00"),
                                ],
                              ),
                              SizedBox(
                                  height: ScreenSize.horizontalBlockSize! * 6),
                            ],
                          )),
                    ),
                    SizedBox(height: ScreenSize.fSize_80()),
                  ],
                ),
              ),
            ),
            banner.getBN('/EMI_in_Advance')
          ],
        ),
      ),
    );
  }
}
