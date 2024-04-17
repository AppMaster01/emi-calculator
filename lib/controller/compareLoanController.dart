import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Media_Qury/Media.dart';

class CompareController extends GetxController {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    PrincipalA.value.dispose();
    RateA.value.dispose();
    YEARA.value.dispose();
    MONTHA.value.dispose();
    PrincipalB.value.dispose();
    RateB.value.dispose();
    YEARB.value.dispose();
    MONTHB.value.dispose();
  }

  final PrincipalA = TextEditingController().obs;
  final RateA = TextEditingController().obs;
  final YEARA = TextEditingController().obs;
  final MONTHA = TextEditingController().obs;
  final PrincipalB = TextEditingController().obs;
  final RateB = TextEditingController().obs;
  final YEARB = TextEditingController().obs;
  final MONTHB = TextEditingController().obs;
  var REST = false.obs;
  var Calculate = false.obs;
  var Load = false.obs;
  var amountA = 0.0.obs;
  var rateA = 0.0.obs;
  var emiresultA = 0.0.obs;
  var TotalPaymentA = 0.0.obs;
  var TotalInterstA = 0.0.obs;
  var amountB = 0.0.obs;
  var rateB = 0.0.obs;
  var emiresultB = 0.0.obs;
  var TotalPaymentB = 0.0.obs;
  var TotalInterstB = 0.0.obs;
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
  var deferenceEMI = 0.obs;
  var deferenceRATE = 0.obs;
  var deferenceTOTAL = 0.obs;
  buildUserA() {
    int P = int.parse(PrincipalA.value.text);
    double R = double.parse(RateA.value.text) / 12 / 100;
    int Y = int.parse(YEARA.value.text) * 12 + int.parse(MONTHA.value.text);
    double M = double.parse(Y.toString());
    emiresultA.value = (P * R * pow((1 + R), M) / (pow((1 + R), M) - 1));
    TotalPaymentA.value = emiresultA.value * M;
    TotalInterstA.value = 0.0.obs.value = TotalPaymentA.value - P;
  }

  buildUserB() {
    int P = int.parse(PrincipalB.value.text);
    double R = double.parse(RateB.value.text) / 12 / 100;
    int Y = int.parse(YEARB.value.text) * 12 + int.parse(MONTHB.value.text);
    double M = double.parse(Y.toString());
    emiresultB.value = (P * R * pow((1 + R), M) / (pow((1 + R), M) - 1));
    TotalPaymentB.value = emiresultB.value * M;
    TotalInterstB.value = 0.0.obs.value = TotalPaymentB.value - P;
  }
}
