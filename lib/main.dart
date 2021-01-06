import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:security/screens/home.dart';
import 'package:security/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print(message);
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging().configure(
    onMessage: (Map<String, dynamic> message) async {
      // HANDLE IT HERE
      print("onMessage: $message");
      Get.showSnackbar(GetBar(
        title: message['title'],
        message: message['body'],
      ));
    },
    onBackgroundMessage: myBackgroundMessageHandler,
    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    },
  );

  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? SplashScreen() : Home()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          cursorColor: Colors.blue,
          splashColor: Colors.white,
          primaryColor: Colors.blue,
          textSelectionColor: Color(0xff990000),
          primaryTextTheme: TextTheme(
              caption: TextStyle(
                  color: Color(0xff990000),
                  backgroundColor: Color(0xff990000)))),
      home: SplashScreen(),
    );
  }
}
