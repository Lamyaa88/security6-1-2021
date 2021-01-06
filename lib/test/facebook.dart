//
////  this page for login with facebook
//// social media 1 ==== face
////social media 2 ==== twitter
////social media 3 ==== google
//
//import 'package:flutter/material.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert' as JSON;
////===========================================================================================
//class SocialMedia1 extends StatefulWidget {
//  @override
//  _SocialMedia1State createState() => _SocialMedia1State();
//}
//
//class _SocialMedia1State extends State<SocialMedia1> {
////  is loading
//  bool _isLoggedIn = false;
//  Map userProfile;
//  final facebookLogin = FacebookLogin();
//  _loginWithFB() async{
//
//
//    final result = await facebookLogin.logIn(['email']);
//
//
//    switch (result.status) {
//      case FacebookLoginStatus.loggedIn:
//        final token = result.accessToken.token;
//        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
//        final profile = JSON.jsonDecode(graphResponse.body);
//        print(profile);
//        print(facebookLogin.logIn(["email"]));
//        setState(() {
//          userProfile = profile;
//          _isLoggedIn = true;
//        });
//        break;
//
//      case FacebookLoginStatus.cancelledByUser:
//        setState(() => _isLoggedIn = false );
//        break;
//      case FacebookLoginStatus.error:
//        setState(() => _isLoggedIn = false );
//        break;
//    }
//
//  }
//
//  _logout(){
//    facebookLogin.logOut();
//    setState(() {
//      _isLoggedIn = false;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          backgroundColor: redColor,
//        ),
//        body: Center(
//            child: _isLoggedIn
//                ? Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Image.network(userProfile["picture"]["data"]["url"], height: 50.0, width: 50.0,),
//                Text(userProfile["name"]),
//                OutlineButton( child: Text("Logout"), onPressed: (){
//                  _logout();
//                },),
//              ],
//            )
//                : Center(
//              child: OutlineButton(
//                child: Text("Login with Facebook"),
//                onPressed: () {
//                  _loginWithFB();
//                },
//              ),
//
//            )),
//      ),
//    );
//  }
//
//
//
//}
//const whiteColor = Colors.white;
//const redColor = Color(0xff990000);
//const pinkColor = Colors.pink;
//const secondaryWhiteColor = Color(0xFFEEEEEE);
//const blackColor = Color(0xFF424242);
//const grayColor = Colors.grey;
//
