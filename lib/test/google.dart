//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:http/http.dart' as http;
//import 'package:security/screens/home.dart';
//import 'dart:convert';
//
//import 'package:shared_preferences/shared_preferences.dart';
//
////============================================================================
//UserModel userModelFromJson(dynamic str) =>
//    UserModel.fromJson(json.decode(str));
//dynamic userModelToJson(UserModel data) => json.encode(data.toJson());
//
////========================================================================================================================= user model class
//class UserModel {
//  final String email;
//  final String name;
//  final String token;
//  final String mobile;
//  final String password;
//  final String message;
//  final String result;
//  final dynamic data;
////===================================================================================================================================constructor
//  UserModel({this.email,this.name,this.token,this.mobile, this.password, this.message, this.result, this.data});
//
//  //===================================================================================================================================from json
//  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
//      email: json["email"],
//      name: json["name"],
//      mobile: json["mobile"],
//      token: json["token"],
//      password: json["password"],
//      message: json["message"],
//      result: json["result"],
//      data: json["data"]
//
////    image: json["image"],
////   content: json['content'],
////    date: json['date']
//      );
////=================================================================================================================================== to json
//  Map<dynamic, dynamic> toJson() => {
//    "email": email,
//    "name": name,
//    "mobile":mobile,
//    "token": token,
//    "password": password,
//    "message": message,
//    "result": result,
//    "data": data
//      };
//}
//
////=============================================================================================
//GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);
////=============================================================================================
//
//Future<UserModel> createUser(
//    String email, String token, String mobile, String name) async {
//  final String apiUrl = "http://n5ba.com/gaurds/the_json/register_socialmedia";
//
//  final response = await http.post(apiUrl, body: {
//    "email": email,
//    "token": token,
//    "mobile": mobile,
//    "name": name,
//
////    "job": jobTitle
//  });
//
//  if (response.statusCode == 200) {
//    final String responseString = response.body;
//    print(response.body);
//
//    return userModelFromJson(responseString);
//  } else {
//    return null;
//  }
//}
//
////==============================================================================
//class SignInWithGooogle extends StatefulWidget {
//  @override
//  _SignInWithGooogleState createState() => _SignInWithGooogleState();
//}
//
//class _SignInWithGooogleState extends State<SignInWithGooogle> {
//  bool rememberMe = true;
//  static UserModel _user;
//  String deviceToken = "there is no token ";
//  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//
////==============================================================
////================================  ====================
////===============================================================
//  _login() async {
//    try {
//      await _googleSignIn.signIn();
//      final prefs = await SharedPreferences.getInstance();
//      prefs.setBool('IsLoggedIn', true);
//      Future.delayed(Duration.zero).then((_) {
//        //login success.   //Navigator.of(context).pushNamed(AppLandingScreen.routeName);
//      });
//    } catch (err) {
//      print(err);
//    }
//  }
//
////  =========================================================================
////  ============================================================================
//  GoogleSignInAccount _currentUser;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
//      setState(() {
//        _currentUser = account;
//      });
//    });
//    _googleSignIn.signInSilently();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Google Sign in Demo'),
//      ),
//      body: Center(child: _buildBody()),
//    );
//  }
//
//  Widget _buildBody() {
//    if (_currentUser != null) {
//      return Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,
//        children: <Widget>[
//          ListTile(
//            leading: GoogleUserCircleAvatar(
//              identity: _currentUser,
//            ),
//            title: Text(_currentUser.displayName ?? ''),
//            subtitle: Text(_currentUser.email ?? ''),
//          ),
//          RaisedButton(
//            onPressed: () async {
//
//              print( " user name is : ${_currentUser.displayName}");
//              print( " user email is : ${_currentUser.email}");
//
//              final String email = _currentUser.email;
//              final String token = deviceToken;
//              final String mobile = "mobile";
//              final String name = _currentUser.displayName;
//              final UserModel user =
//                  await createUser(email, token, mobile, name);
//              //--------------------------------------------------------------------------------- api function
//              setState(() {
//                _user = user;
//              });
////                    //--------------------------------------------------------------------------------------- if true go to home
//              if (_user.result == 'true') {
//                if (rememberMe == true) {
//                  SharedPreferences prefs =
//                      await SharedPreferences.getInstance();
//                  prefs.setString('email', _user.data[0]["email"]);
//                  prefs.setString('name', _user.data[0]["name"]);
//                }
//
//                Navigator.pushReplacement(context,
//                    MaterialPageRoute(builder: (BuildContext ctx) => Home()));
////    await StorageUtil.getInstance();
////    //--------------------------------------------------------------------------------------- to store id
////    StorageUtil.putStringId("key_id", _user.data[0]["id"]);
////    await StorageUtil.getInstance();
////    //--------------------------------------------------------------------------------------- to store email
////    StorageUtil.putStringEmail(
////    "key_email", _user.data[0]["email"]);
////                        ================================================================================== new shared
//                SharedPreferences preferences =
//                    await SharedPreferences.getInstance();
//                preferences.setString('name', _user.data[0]["name"]);
//                preferences.setString('email', _user.data[0]["email"]);
//                preferences.setString('mobile', _user.data[0]["mobile"]);
//                preferences.setString('password', _user.data[0]["password"]);
//                preferences.setString('id', _user.data[0]["id"]);
////                        ================================================================================== new shared
//
//                //--------------------------------------------------------------------------------------- to store password
////    StorageUtil.putStringPassword(
////    "key_password", _user.data[0]["password"]);
////    //--------------------------------------------------------------------------------------  to store name
////    StorageUtil.putStringName(
////    "key_name", _user.data[0]["name"]);
////    //-------------------------------------------------------------------------------------- to store phone
////    StorageUtil.putStringPhone(
////    "key_phone", _user.data[0]["mobile"]);
//                //  ================================================================== to clear email and password
//
////    emailController.clear();
////    passwordController.clear();
//
////                                ========================================================================================= else if result false
//              } else if (_user.result == 'false') {
//                Fluttertoast.showToast(
//                  msg: _user.message,
//                  backgroundColor: Colors.black,
//                  fontSize: 10,
//                );
//              }
////                              ====================================================================================== the end of else condition
//              _firebaseMessaging.getToken().then((token) {
//                print('token is :${token}');
//                setState(() {
//                  deviceToken = token;
//                }); // Print the Token in Console
//              });
//            },
//            child: Text('متابعة'),
//          ),
//          RaisedButton(
//            onPressed: _handleSignOut,
//            child: Text('التسجيل بحساب آخر'),
//          ),
//        ],
//      );
//    } else {
//      return Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,
//        children: <Widget>[
//          Text(''),
//          RaisedButton(
//            onPressed: _handleSignIn,
//            child: Text('تسجيل الدخول بحساب جوجل'),
//          )
//        ],
//      );
//    }
//  }
//
//  Future<void> _handleSignIn() async {
//    try {
//      await _googleSignIn.signIn();
//    } catch (error) {
//      print(error);
//    }
//  }
//
//  Future<void> _handleSignOut() async {
//    _googleSignIn.disconnect();
//  }
//}
