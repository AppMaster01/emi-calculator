import 'dart:convert';
import 'package:emicalculator/views/Home%20Page.dart';
import 'package:emicalculator/views/calculator/CompareLoanScreen.dart';
import 'package:emicalculator/views/calculator/EMI%20in%20Advance.dart';
import 'package:emicalculator/views/calculator/EMI.dart';
import 'package:emicalculator/views/calculator/GST.dart';
import 'package:emicalculator/views/calculator/Interest%20Rate.dart';
import 'package:emicalculator/views/calculator/Loan%20Period.dart';
import 'package:emicalculator/views/calculator/SIP.dart';
import 'package:emicalculator/views/cash%20counter/Cash_Counter.dart';
import 'package:emicalculator/views/splash%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'In_Ap_Web_View/Web_View.dart';
import 'My_Controller.dart';

final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
RxMap Calculator = {}.obs;

Future initConfig() async {
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));
  await remoteConfig.fetchAndActivate();
}

AppOpenAd? appOpenAd;

loadAd() {
  AppOpenAd.load(
    adUnitId: Calculator.value["APPOPEN"],
    orientation: AppOpenAd.orientationPortrait,
    request: const AdManagerAdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        print("Ad Loadede.................................");
        appOpenAd = ad;
        ad.show();
      },
      onAdFailedToLoad: (error) {
        AppOpenAd.load(
          adUnitId: Calculator.value["APPOPEN"],
          orientation: AppOpenAd.orientationPortrait,
          request: const AdManagerAdRequest(),
          adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad) {
              print("Ad Loadede.................................");
              appOpenAd = ad;
              // isLoaded=true;
              ad.show();
            },
            onAdFailedToLoad: (error) {},
          ),
        );
      },
    ),
  );
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
    "Hello ", "Rohan",
    playSound: true, importance: Importance.high);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  initConfig().whenComplete(() {
    Calculator.value = json.decode(remoteConfig.getString('calculator'));
    loadAd();
  });

  return runApp(
    GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Splash_screen(),
        '/In_App_Privacy': (context) => In_App_Privacy(),
        '/Home_Page': (context) => Home_Page(),
        '/EMI_Calculator': (context) => EMI_Calculator(),
        '/GST_Calculator': (context) => GST_Calculator(),
        '/SIP_Calculator': (context) => SIP_Calculator(),
        '/Cash_Counter': (context) => Cash_Counter(),
        '/CompareLoanScreen': (context) => CompareLoanScreen(),
        '/EMI_in_Advance': (context) => EMI_in_Advance(),
        '/Loan_Period': (context) => Loan_Period(),
        '/Interest_Rate': (context) => Interest_Rate(),
      },
      // home: FirstPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
