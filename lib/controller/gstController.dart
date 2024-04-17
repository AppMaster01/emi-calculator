import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Media_Qury/Media.dart';

class GstController extends GetxController {
  var abc = Get.arguments;
  var ONE = false.obs;
  var TWO = false.obs;
  var THREE = false.obs;
  var FOR = false.obs;
  var FIVE = false.obs;
  var SIX = false.obs;
  var REST = false.obs;
  var Calculate = false.obs;
  var ADD = false.obs;
  var REMOVE = false.obs;
  final Principal = TextEditingController().obs;
  var Rate = 0.obs;
  var load = false.obs;
  var investment = 0.0.obs;
  var interest = 0.0.obs;
  var sip = 0.0.obs;
  final numberFormat = NumberFormat("##,##0.00", "en_US");
  var GST = 0.0.obs;
  var id = 0.0.obs;
  var Original = 0.0.obs;
  var Net = 0.0.obs;
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

  calculation() {
    int Amount = int.parse(Principal.value.text);
    double rate = double.parse(Rate.value.toString());
    // GST.value = Amount * Rate / 100;
    GST.value = id.value == 1
        ? (Amount * (rate / 100))
        : (Amount - (Amount * (100 / (100 + rate))));
    Original.value = id.value == 1
        ? (double.parse(Amount.toString()) + GST.value)
        : (double.parse(Amount.toString()) - GST.value);
    Net.value = double.parse(Amount.toString());
  }
}
