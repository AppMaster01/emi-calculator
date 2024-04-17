import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmiController extends GetxController {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Principal.value.dispose();
    Rate.value.dispose();
  }

  final Principal = TextEditingController().obs;
  final Rate = TextEditingController().obs;
  final YEAR = TextEditingController().obs;
  final MONTH = TextEditingController().obs;
  var REST = false.obs;
  var Calculate = false.obs;
  var Load = false.obs;

  var amount = 0.0.obs;
  var rate = 0.0.obs;
  var emiresult = 0.0.obs;
  var TotalPayment = 0.0.obs;
  var TotalInterst = 0.0.obs;

  var abc = Get.arguments;

  final numberFormat = NumberFormat("##,##0.00", "en_US");

  buildUser() {
    int P = int.parse(Principal.value.text);
    double R = double.parse(Rate.value.text) / 12 / 100;
    int Y = int.parse(YEAR.value.text) * 12 + int.parse(MONTH.value.text);
    double M = double.parse(Y.toString());
    emiresult.value = (P * R * pow((1 + R), M) / (pow((1 + R), M) - 1));
    TotalPayment.value = emiresult.value * M;
    TotalInterst.value = 0.0.obs.value = TotalPayment.value - P;
  }
}
