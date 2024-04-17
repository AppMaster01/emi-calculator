import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Media_Qury/Media.dart';
import '../coman/widget controller.dart';

class HomeController extends GetxController {
  Future<bool> onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Scaffold _buildExitDialog(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: ScreenSize.horizontalBlockSize! * 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  border: Border.all(color: const Color(0xffE2E6EA))),
              child: Column(children: [
                SizedBox(height: ScreenSize.fSize_34()),
                Icon(Icons.exit_to_app,
                    color: Color(0xff55887c),
                    size: ScreenSize.horizontalBlockSize! * 15),
                SizedBox(height: ScreenSize.fSize_34()),
                Container(
                  width: ScreenSize.horizontalBlockSize! * 70,
                  child: Text(
                    'Are you sure you want to Quit?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.prozaLibre(
                        color: Colors.black,
                        fontSize: ScreenSize.fSize_20(),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: ScreenSize.fSize_34()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    controllerCash.getText(
                        () => SystemNavigator.pop(),
                        ScreenSize.fSize_100(),
                        ScreenSize.fSize_40(),
                        100,
                        Center(
                          child: controllerTextlibra.getPiker(
                              'Yes', 0xffffffff, FontWeight.w500, 4.1),
                        )),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: Container(
                        width: ScreenSize.fSize_100(),
                        height: ScreenSize.fSize_40(),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFCEEBEE)),
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: Center(
                          child: controllerTextlibra.getPiker(
                              'No', 0xff000000, FontWeight.w600, 4.5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.fSize_10())
              ]),
            ),
          ],
        ));
  }
  launchATMUrl(String lat) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
