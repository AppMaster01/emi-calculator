import 'dart:math';

import 'package:emicalculator/Ad%20Controller/Back%20controller.dart';
import 'package:emicalculator/Ad%20Controller/Google_Ads.dart';
import 'package:emicalculator/controller/compareLoanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Media_Qury/Media.dart';
import '../../coman/widget controller.dart';

class CompareLoanScreen extends StatefulWidget {
  const CompareLoanScreen({super.key});

  @override
  State<CompareLoanScreen> createState() => _CompareLoanScreenState();
}

class _CompareLoanScreenState extends State<CompareLoanScreen> {
  final con = Get.put(CompareController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/CompareLoanScreen', ''),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text('Compare Loan',
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
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //========================================================================================================Loan A==================================
                    Center(
                      child: Text('Loan A',
                          style: GoogleFonts.karla(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff55887c),
                              fontSize: ScreenSize.horizontalBlockSize! * 7)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.horizontalBlockSize! * 45),
                            child: controllerfiled.gettextfiled(
                                double.infinity,
                                con.PrincipalA.value,
                                "Rate",
                                TextInputType.number),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: ScreenSize.horizontalBlockSize! * 45,
                            ),
                            child: controllerfiled.gettextfiled(
                                double.infinity,
                                con.RateA.value,
                                "Principal",
                                TextInputType.number),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.horizontalBlockSize! * 45),
                            child: controllerfiled.gettextfiled(double.infinity,
                                con.YEARA.value, "Month", TextInputType.number),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: ScreenSize.horizontalBlockSize! * 45,
                            ),
                            child: controllerfiled.gettextfiled(double.infinity,
                                con.MONTHA.value, "Year", TextInputType.number),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    //=========================================================================================================Loan B=============================================
                    Center(
                      child: Text('Loan B',
                          style: GoogleFonts.karla(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff55887c),
                              fontSize: ScreenSize.horizontalBlockSize! * 7)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.horizontalBlockSize! * 45),
                            child: controllerfiled.gettextfiled(
                                double.infinity,
                                con.PrincipalB.value,
                                "Rate",
                                TextInputType.number),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: ScreenSize.horizontalBlockSize! * 45,
                            ),
                            child: controllerfiled.gettextfiled(
                                double.infinity,
                                con.RateB.value,
                                "Principal",
                                TextInputType.number),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.horizontalBlockSize! * 45),
                            child: controllerfiled.gettextfiled(double.infinity,
                                con.YEARB.value, "Month", TextInputType.number),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: ScreenSize.horizontalBlockSize! * 45,
                            ),
                            child: controllerfiled.gettextfiled(double.infinity,
                                con.MONTHB.value, "Year", TextInputType.number),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    //=========================================================================================================Rest Compare Button=============================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            con.REST.value = true;
                            con.Calculate.value = false;
                            con.PrincipalA.value.clear();
                            con.RateA.value.clear();
                            con.YEARA.value.clear();
                            con.MONTHA.value.clear();
                            con.PrincipalB.value.clear();
                            con.RateB.value.clear();
                            con.YEARB.value.clear();
                            con.MONTHB.value.clear();
                            con.Load.value = false;
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
                            if (con.PrincipalA.value.text.isEmpty ||
                                con.RateA.value.text.isEmpty ||
                                con.YEARA.value.text.isEmpty ||
                                con.MONTHA.value.text.isEmpty ||
                                con.PrincipalB.value.text.isEmpty ||
                                con.RateB.value.text.isEmpty ||
                                con.YEARB.value.text.isEmpty ||
                                con.MONTHB.value.text.isEmpty) {
                              showToast();
                            } else if (con.PrincipalA.value.text.isNotEmpty ||
                                con.RateA.value.text.isNotEmpty ||
                                con.YEARA.value.text.isNotEmpty ||
                                con.MONTHA.value.text.isNotEmpty ||
                                con.PrincipalB.value.text.isNotEmpty ||
                                con.RateB.value.text.isNotEmpty ||
                                con.YEARB.value.text.isNotEmpty ||
                                con.MONTHB.value.text.isNotEmpty) {
                              con.Load.value = true;
                              con.buildUserA();
                              con.buildUserB();
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
                              child: controllerTextlibra.getPiker(
                                  'Compare Loan',
                                  0xffffffff,
                                  FontWeight.w500,
                                  4.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    //=========================================================================================================Total=============================================
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(12),
                        child: controllerContainer.getPiker(
                            double.infinity,
                            5,
                            Column(
                              children: [
                                SizedBox(
                                    height:
                                        ScreenSize.horizontalBlockSize! * 2),
                                controllercaltext2.getText(
                                    'Calculate', 'EMI', 'Interest', """Total
                      Payable"""),
                                Divider(
                                  color: const Color(0xFFc7d1d2),
                                  thickness:
                                      ScreenSize.horizontalBlockSize! * 0.4,
                                ),
                                controllercaltext2.getText(
                                    'Loan 1',
                                    '${con.Load.value == true ? con.numberFormat.format(con.emiresultA.value.round()) : '00'}',
                                    '${con.Load.value == true ? con.numberFormat.format(con.emiresultA.value.round()) : "00"}',
                                    "${con.Load.value == true ? con.numberFormat.format(con.TotalPaymentA.value.round()) : "00"}"),
                                Divider(
                                  color: const Color(0xFFc7d1d2),
                                  thickness:
                                      ScreenSize.horizontalBlockSize! * 0.4,
                                ),
                                controllercaltext2.getText(
                                    'Loan 2',
                                    '${con.Load.value == true ? con.numberFormat.format(con.emiresultB.value.round()) : "00"}',
                                    '${con.Load.value == true ? con.numberFormat.format(con.emiresultB.value.round()) : "00"}',
                                    "${con.Load.value == true ? con.numberFormat.format(con.TotalPaymentB.value.round()) : "00"}"),
                                Divider(
                                  color: const Color(0xFFc7d1d2),
                                  thickness:
                                      ScreenSize.horizontalBlockSize! * 0.4,
                                ),
                                controllercaltext2.getText(
                                    'Deference',
                                    '${con.Load.value == true ? con.numberFormat.format(con.emiresultA.value.round() - con.emiresultB.value.round()) : "00"}',
                                    '${con.Load.value == true ? con.numberFormat.format(con.emiresultA.value.round() - con.emiresultB.value.round()) : "00"}',
                                    """${con.Load.value == true ? con.numberFormat.format(con.TotalPaymentA.value.round() - con.TotalPaymentB.value.round()) : "00"}"""),
                                SizedBox(
                                    height:
                                        ScreenSize.horizontalBlockSize! * 3),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.fSize_80(),
                    )
                  ],
                ),
              ),
            ),
            banner.getBN('/CompareLoanScreen')
          ],
        ),
      ),
    );
  }
}
