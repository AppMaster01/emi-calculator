import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiAdvanceController extends GetxController {
  var id = 1.obs;
  var id2 = 1.obs;
  var Result = "0".obs;
  var Totalrate = "0".obs;
  var TotalMonth = "0".obs;
  var TotalPayment = "0".obs;
  var load = false.obs;

  List tenureTypes = ['Month', 'Year'].obs;
  var tenureType = "Year".obs;
  var switchValue = false.obs;
  var value = false.obs;

  var principalController = TextEditingController().obs;
  var rateController = TextEditingController().obs;
  var feesController = TextEditingController().obs;
  var tenureController = TextEditingController().obs;

  emiCalculation() {
    int Principal = int.parse(principalController.value.text);
    int Rate = int.parse(rateController.value.text);
    int Year = int.parse(tenureController.value.text);
    // int Month = int.parse(Aloanmonth.text);

    double A = 0.0;
    double B = 0.0;
    int P = Principal;
    double r = Rate / 12 / 100;
    int n = Year * 12;
    int n1 = Year;
    print("N valueee:  $n");

    id.value == 1
        ? A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1))
        : A = (P * r * pow((1 + r), n1) / (pow((1 + r), n1) - 1));
    var ee = Principal - A;
    id.value == 1
        ? B = (ee * r * pow((1 + r), n - 1) / (pow((1 + r), n - 1) - 1))
        : B = (ee * r * pow((1 + r), n1 - 1) / (pow((1 + r), n1 - 1) - 1));

    print("AAAA  $A");
    print("PPPP  $P");
    print("rrrr  $r");
    print("nnnn  $n");
    id2.value == 1
        ? Result.value = A.toStringAsFixed(0)
        : Result.value = B.toStringAsFixed(0);

    int totalrate = id.value == 1
        ? int.parse(Result.value) * n - Principal
        : int.parse(Result.value) * n1 - Principal;
    print("rateee:  $totalrate");

    int totalpayment = id.value == 1
        ? int.parse(Result.value) * n
        : int.parse(Result.value) * n1;
    print("payment:  $totalpayment");

    // TotalMonth.value = n.toStringAsFixed(0);
    id.value == 1
        ? TotalMonth.value = Year.toString()
        : TotalMonth.value = n.toStringAsFixed(0);

    Totalrate.value = totalrate.toStringAsFixed(0);

    TotalPayment.value = totalpayment.toStringAsFixed(0);
    print("loanamount ${Result.value}");
    return Result.value;
  }
}
