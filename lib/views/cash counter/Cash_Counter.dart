import 'package:emicalculator/Ad%20Controller/Back%20controller.dart';
import 'package:emicalculator/Ad%20Controller/Google_Ads.dart';
import 'package:emicalculator/controller/cashCounter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../Media_Qury/Media.dart';
import '../../coman/widget controller.dart';

class Cash_Counter extends StatefulWidget {
  const Cash_Counter({super.key});

  @override
  State<Cash_Counter> createState() => _Cash_CounterState();
}

class _Cash_CounterState extends State<Cash_Counter> {
  final con = Get.put(CashCounterController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Cash_Counter', ''),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Cash Counter',
              style: GoogleFonts.karla(
                  fontSize: ScreenSize.horizontalBlockSize! * 7)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    Container(
                      height: ScreenSize.horizontalBlockSize! * 140,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: con.CountList.value.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(7),
                                child: Column(
                                  children: [
                                    SizedBox(height: ScreenSize.fSize_20()),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        controllerCash.getText(
                                            () {},
                                            ScreenSize.fSize_90(),
                                            ScreenSize.fSize_40(),
                                            100,
                                            Obx(
                                              () => Center(
                                                child: controllerTextlibra.getPiker(
                                                    '${con.AmountData.value[index]}',
                                                    0xff000000,
                                                    FontWeight.w600,
                                                    4.5),
                                              ),
                                            )),
                                        Obx(
                                          () => Container(
                                            width: ScreenSize
                                                    .horizontalBlockSize! *
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                controllerCash.getText(() {
                                                  con.CountList.value[index] <=
                                                          0
                                                      ? 0
                                                      : con.CountList
                                                          .value[index]--;
                                                  con.ResultList.value[index] =
                                                      con.AmountData
                                                              .value[index] *
                                                          con.CountList
                                                              .value[index];
                                                  con.ResultList.refresh();
                                                  con.CountList.refresh();
                                                  con.AmountData.refresh();
                                                },
                                                    ScreenSize
                                                            .horizontalBlockSize! *
                                                        8,
                                                    ScreenSize
                                                            .horizontalBlockSize! *
                                                        8,
                                                    100,
                                                    Center(
                                                      child: Image(
                                                          image: const AssetImage(
                                                              "asset/image/minus-sign.png"),
                                                          color: Colors.black,
                                                          height: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              0.6),
                                                    )),
                                                controllerTextlibra.getPiker(
                                                    '${con.CountList.value[index]}',
                                                    0xff000000,
                                                    FontWeight.w500,
                                                    4.1),
                                                controllerCash.getText(() {
                                                  con.CountList.value[index]++;
                                                  con.ResultList.value[index] =
                                                      con.AmountData
                                                              .value[index] *
                                                          con.CountList
                                                              .value[index];
                                                  con.ResultList.refresh();
                                                  con.CountList.refresh();
                                                  con.AmountData.refresh();
                                                },
                                                    ScreenSize
                                                            .horizontalBlockSize! *
                                                        8,
                                                    ScreenSize
                                                            .horizontalBlockSize! *
                                                        8,
                                                    100,
                                                    const Center(
                                                      child: Icon(Icons.add,
                                                          color: Colors.black),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => Container(
                                            width: ScreenSize.fSize_90(),
                                            height: ScreenSize.fSize_40(),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFc7d1d2)),
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                              ),
                                            ),
                                            child: Center(
                                              child: controllerTextlibra.getPiker(
                                                  '${con.AmountData.value[index] * con.CountList.value[index]}',
                                                  0xff000000,
                                                  FontWeight.w600,
                                                  4.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: ScreenSize.fSize_20()),
                                  ],
                                ));
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                          padding: const EdgeInsets.all(18),
                          child: Container(
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF6FFFF).withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFc7d1d2)),
                                borderRadius: BorderRadius.circular(
                                    ScreenSize.horizontalBlockSize! * 100),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(17),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      controllerTextlibra.getPiker("Total :-",
                                          0xff000000, FontWeight.w500, 4.1),
                                      controllerTextlibra.getPiker(
                                          "${con.ResultList.value == "" ? con.ResultList.value[0] : con.ResultList.value[0] + con.ResultList.value[1] + con.ResultList.value[2] + con.ResultList.value[3] + con.ResultList.value[4] + con.ResultList.value[5] + con.ResultList.value[6]}/-",
                                          0xff000000,
                                          FontWeight.w500,
                                          4.1)
                                    ],
                                  ),
                                  // SizedBox(height: ScreenSize.fSize_15()),
                                ],
                              ),
                            ),
                          )),
                    ),
                    IconButton(
                        onPressed: () => Share.share(
                            "total:- ${con.ResultList.value == "" ? con.ResultList.value[0] : con.ResultList.value[0] + con.ResultList.value[1] + con.ResultList.value[2] + con.ResultList.value[3] + con.ResultList.value[4] + con.ResultList.value[5] + con.ResultList.value[6]}"),
                        icon: Icon(Icons.share_rounded)),
                    SizedBox(
                      height: ScreenSize.fSize_80(),
                    )
                  ],
                ),
              ),
            ),
            banner.getBN('/Cash_Counter')
          ],
        ),
      ),
    );
  }
}
