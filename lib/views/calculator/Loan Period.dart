import 'dart:math';

import 'package:emicalculator/Ad%20Controller/Back%20controller.dart';
import 'package:emicalculator/Ad%20Controller/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../Media_Qury/Media.dart';
import '../../coman/widget controller.dart';

class Loan_Period extends StatefulWidget {
  const Loan_Period({super.key});

  @override
  State<Loan_Period> createState() => _Loan_PeriodState();
}

class _Loan_PeriodState extends State<Loan_Period> {
  final amountController = TextEditingController().obs;
  final interestController = TextEditingController().obs;
  final emiController = TextEditingController().obs;
  var REST = false.obs;
  var Calculate = false.obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    amountController.value.dispose();
    interestController.value.dispose();
    emiController.value.dispose();
  }

  var amount = 0.0.obs;
  var rate = 0.0.obs;
  var emiresult = 0.0.obs;
  var TotalPayment = 0.0.obs;
  var TotalInterst = 0.0.obs;

  var payment;
  var interest;
  var period = 0.0;
  var months;

  var load = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final numberFormat = NumberFormat("##,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(context, '/Interest_Rate', ''),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text('Loan Period',
              style: GoogleFonts.karla(
                  fontSize: ScreenSize.horizontalBlockSize! * 7)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
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
                                amountController.value,
                                "Principal Amount",
                                TextInputType.number),
                            SizedBox(height: ScreenSize.fSize_12()),
                            controllerfiled.gettextfiled(
                                double.infinity,
                                interestController.value,
                                "Rate of Interest (p.a)",
                                TextInputType.number),
                            SizedBox(height: ScreenSize.fSize_12()),
                            controllerfiled.gettextfiled(double.infinity,
                                emiController.value, "EMI", TextInputType.number),
                            SizedBox(height: ScreenSize.fSize_25()),
                          ],
                        ),
                      ),
                    ),
                    //=========================================================================================================Rest Compare Button=============================================
                    SizedBox(height: ScreenSize.fSize_20()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            REST.value = true;
                            Calculate.value = false;
                            amountController.value.clear();
                            interestController.value.clear();
                            emiController.value.clear();
                            load.value = false;
                            FocusScope.of(context).requestFocus(new FocusNode());
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
                            REST.value = false;
                            Calculate.value = true;
                            if (amountController.value.text.isEmpty ||
                                interestController.value.text.isEmpty ||
                                emiController.value.text.isEmpty) {
                              showToast();
                            } else if (amountController.value.text.isNotEmpty ||
                                interestController.value.text.isNotEmpty ||
                                emiController.value.text.isEmpty) {
                              calculation();
                              load.value = true;
                            }
                            FocusScope.of(context).requestFocus(new FocusNode());
                          },
                          child: Container(
                            width: ScreenSize.horizontalBlockSize! * 37,
                            height: ScreenSize.horizontalBlockSize! * 12,
                            decoration: BoxDecoration(
                                color: Color(0xff55887c),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: controllerTextlibra.getPiker(
                                  'Calculate', 0xffffffff, FontWeight.w500, 4.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //=========================================================================================================Total=============================================
                    SizedBox(height: ScreenSize.fSize_20()),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: controllerContainer.getPiker(
                          double.infinity,
                          5,
                          Column(
                            children: [
                              SizedBox(height: ScreenSize.horizontalBlockSize! * 7),
                              Row(
                                children: [
                                  SizedBox(
                                      width: ScreenSize.horizontalBlockSize! * 7.5),
                                  controllercaltext.getText("Monthly EMI",
                                      '${load.value == true ? emiController.value.text : "0.0"}'),
                                ],
                              ),
                              SizedBox(height: ScreenSize.horizontalBlockSize! * 3),
                              controllerdivider.getText(),
                              SizedBox(height: ScreenSize.horizontalBlockSize! * 3),
                              Row(
                                children: [
                                  SizedBox(
                                      width: ScreenSize.horizontalBlockSize! * 7.5),
                                  controllercaltext.getText("Total Interest",
                                      '${load.value == true ? interest.toString() : "00"}'),
                                ],
                              ),
                              SizedBox(height: ScreenSize.horizontalBlockSize! * 3),
                              controllerdivider.getText(),
                              SizedBox(height: ScreenSize.horizontalBlockSize! * 3),
                              Row(
                                children: [
                                  SizedBox(
                                      width: ScreenSize.horizontalBlockSize! * 7.5),
                                  controllercaltext.getText("Total Payment",
                                      '${load.value == true ? payment.toString() : "00"}'),
                                ],
                              ),
                              SizedBox(height: ScreenSize.horizontalBlockSize! * 3),
                              controllerdivider.getText(),
                              SizedBox(height: ScreenSize.horizontalBlockSize! * 3),
                              Row(
                                children: [
                                  SizedBox(
                                      width: ScreenSize.horizontalBlockSize! * 7.5),
                                  controllercaltext.getText("Period",
                                      '${load.value == true ? period.toStringAsFixed(2) : "00"}'),
                                ],
                              ),
                              SizedBox(height: ScreenSize.horizontalBlockSize! * 7),
                            ],
                          )),
                    ),
                    SizedBox(height: ScreenSize.fSize_80(),)
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
    double R = double.parse(interestController.value.text) / 12 / 100;
    int E = int.parse(emiController.value.text);
    int time = (log(E) - log(E - (P * R))) ~/ log(1 + R);
    period = time / 12;
    payment = E * time;
    months = time;
    interest = payment - P;
  }
}
