import 'package:emicalculator/Media_Qury/Media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
final controllercontainer = Get.put(containercontroller());
final controllercontainer2 = Get.put(container2controller());
final controllerTextlibra = Get.put(TEXTlibraController());
final controllerTextlibra2 = Get.put(TEXTlibra2Controller());
final controllerCash = Get.put(CashCountcontroller());
final controllerfiled = Get.put(filedcontroller());
final controllerCalculate = Get.put(CaculateButton());
final controllerContainer = Get.put(ContainerController());
final controllercaltext = Get.put(caltextcontroller());
final controllercaltext2 = Get.put(caltext2controller());
final controllerdivider = Get.put(dividercontroller());
final controllerradio = Get.put(RadioButoon());
final controllerGst = Get.put(GstButton());

class containercontroller extends GetxController {
  getcontain(ontap, image, text) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(
            right: ScreenSize.fSize_20(), left: ScreenSize.fSize_20()),
        child: Row(
          children: [
            Container(
              height: ScreenSize.horizontalBlockSize! * 13,
              width: ScreenSize.horizontalBlockSize! * 13,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  height: ScreenSize.horizontalBlockSize! * 10,
                ),
              ),
            ),
            SizedBox(width: ScreenSize.fSize_18()),
            Text(text,
                style: GoogleFonts.karla(
                    fontSize: ScreenSize.horizontalBlockSize! * 5)),
          ],
        ),
      ),
    );
  }
}

class container2controller extends GetxController {
  getcontain(ontap, image, text) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(
            right: ScreenSize.fSize_20(), left: ScreenSize.fSize_20()),
        child: Row(
          children: [
            Container(
              height: ScreenSize.horizontalBlockSize! * 13,
              width: ScreenSize.horizontalBlockSize! * 13,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  height: ScreenSize.horizontalBlockSize! * 10,
                  color: Color(0xff55887c),
                ),
              ),
            ),
            SizedBox(width: ScreenSize.fSize_18()),
            Text(text,
                style: GoogleFonts.karla(
                    fontSize: ScreenSize.horizontalBlockSize! * 5)),
          ],
        ),
      ),
    );
  }
}

class TEXTlibraController extends GetxController {
  getPiker(text, color, fontWeight, fontSize) {
    return Text(
      text,
      style: GoogleFonts.karla(
          color: Color(color),
          fontWeight: fontWeight,
          fontSize: ScreenSize.horizontalBlockSize! * fontSize),
    );
  }
}

class TEXTlibra2Controller extends GetxController {
  getPiker(text, color, fontWeight, fontSize) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.karla(
          color: Color(color),
          fontWeight: fontWeight,
          fontSize: ScreenSize.horizontalBlockSize! * fontSize),
    );
  }
}

class CashCountcontroller extends GetxController {
  getText(ontap, width, height, radius, child) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: const Color(0xFFc7d1d2),
            borderRadius: BorderRadius.all(
                Radius.circular(ScreenSize.horizontalBlockSize! * radius))),
        child: child,
      ),
    );
  }
}

class filedcontroller extends GetxController {
  gettextfiled(widght, controller, text, KYPE) {
    return Padding(
      padding: EdgeInsets.only(
          left: ScreenSize.fSize_13(), right: ScreenSize.fSize_13()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: TextField(
                  controller: controller,
                  keyboardType: KYPE,
                  cursorColor: const Color(0xFF55887c),
                  decoration: InputDecoration(
                      hintText: text,
                      hintStyle: GoogleFonts.karla(
                          color: const Color(0xFF000000),
                          fontSize: ScreenSize.fSize_13(),
                          fontWeight: FontWeight.w400),
                      border: UnderlineInputBorder()),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CaculateButton extends GetxController {
  getPiker(ontap, Ccolor, Bcolor, Scolor, Tcolor, text) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: ScreenSize.horizontalBlockSize! * 40,
        height: ScreenSize.horizontalBlockSize! * 13,
        decoration: ShapeDecoration(
          color: Ccolor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Bcolor),
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: Scolor,
              blurRadius: 0,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child:
              controllerTextlibra.getPiker(text, Tcolor, FontWeight.w600, 4.8),
        ),
      ),
    );
  }
}

class ContainerController extends GetxController {
  getPiker(width, radius, child) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]),
      child: child,
    );
  }
}

class caltextcontroller extends GetxController {
  getText(text, text1) {
    return Row(
      children: [
        Container(
          width: ScreenSize.horizontalBlockSize! * 38,
          // color: Colors.yellow,
          child: controllerTextlibra.getPiker(
              text, 0xFF000000, FontWeight.w400, 3.5),
        ),
        SizedBox(width: ScreenSize.horizontalBlockSize! * 1),
        Container(
          // color: Colors.yellow,
          width: ScreenSize.horizontalBlockSize! * 40,
          child: Center(
            child: Text(
              text1,
              textAlign: TextAlign.center,
              style: GoogleFonts.karla(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenSize.horizontalBlockSize! * 4),
            ),
          ),
        )
      ],
    );
  }
}

class caltext2controller extends GetxController {
  getText(text, text1, text2, text3) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: ScreenSize.horizontalBlockSize! * 19,
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: GoogleFonts.karla(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenSize.horizontalBlockSize! * 3.8),
            ),
          ),
          Container(
            width: ScreenSize.horizontalBlockSize! * 22,
            child: controllerTextlibra2.getPiker(
                text1, 0xFF000000, FontWeight.w500, 3.5),
          ),
          Container(
            width: ScreenSize.horizontalBlockSize! * 18,
            child: controllerTextlibra2.getPiker(
                text2, 0xFF000000, FontWeight.w500, 3.5),
          ),
          Container(
            width: ScreenSize.horizontalBlockSize! * 22,
            child: controllerTextlibra2.getPiker(
                text3, 0xFF000000, FontWeight.w500, 3.5),
          ),
        ],
      ),
    );
  }
}

class dividercontroller extends GetxController {
  getText() {
    return Divider(
      color: const Color(0xFFc7d1d2),
      indent: ScreenSize.fSize_28(),
      endIndent: ScreenSize.fSize_28(),
      thickness: ScreenSize.horizontalBlockSize! * 0.4,
    );
  }
}

class RadioButoon extends GetxController {
  getPiker(ontap, color, width, text, SIZE) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: ontap,
          child: Stack(
            children: [
              Container(
                width: ScreenSize.fSize_28(),
                height: ScreenSize.fSize_28(),
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xff55887c)),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: ScreenSize.fSize_15(),
                    height: ScreenSize.fSize_15(),
                    decoration: ShapeDecoration(
                      color: color,
                      shape: const OvalBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: SIZE),
        Container(
          // color: Colors.black12,
          width: width,
          child: controllerTextlibra.getPiker(
              text, 0xff000000, FontWeight.w600, 4.2),
        )
      ],
    );
  }
}

class GstButton extends GetxController {
  getPiker(ontap, color, text, Boxcolor, colortext) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: ScreenSize.horizontalBlockSize! * 38,
          height: ScreenSize.horizontalBlockSize! * 12,
          decoration: ShapeDecoration(
            color: const Color(0xFFffffff),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: color),
              borderRadius: BorderRadius.circular(25.50),
            ),
            shadows: [
              BoxShadow(
                color: Boxcolor,
                blurRadius: 0,
                offset: const Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: controllerTextlibra.getPiker(
                text, colortext, FontWeight.w500, 4),
          )),
    );
  }
}
