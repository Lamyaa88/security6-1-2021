import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

//=====================================================================================================

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);
//=============================================================================================

Future<UserModel> createUser(
    String email, String token, String mobile, String name) async {
  final String apiUrl = "http://n5ba.com/gaurds/the_json/register_socialmedia";

  final response = await http.post(apiUrl, body: {
    "email": email,
    "token": token,
    "mobile": mobile,
    "name": name,

//    "job": jobTitle
  });

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(response.body);

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}





class LoginWithGoogle extends StatefulWidget {


  @override

  _LoginWithGoogleState createState() => _LoginWithGoogleState();

}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  bool rememberMe = true;
  static UserModel _user;
  String deviceToken = "there is no token ";
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  @override


  Widget build(BuildContext context) {


    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: secondaryWhiteColor,
      body: Stack(
        children: <Widget>[
          Container(
            color: redColor,
            height:height*.22,
            child: Stack(

              children: <Widget>[
                Container(
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                        ],
                      ),

                    )

                ),
                Container(
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        heightSizedBox(context, .08),
                        Row(


                          children: <Widget>[


                            widthSizedBox(context, .3),



                            widthSizedBox(context, .3),


                            widthSizedBox(context,.03),


                          ],
                          mainAxisAlignment: MainAxisAlignment.center,

                        ),
                        heightSizedBox(context, .04),


                      ],
                    )

                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Card(
              //===================================================================================================== build body

              child: _buildBody( context),
              margin: EdgeInsets.fromLTRB(6.5,20, 6.5,0),
              elevation:0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              clipBehavior: Clip.antiAlias,
            ),
          )
        ],
      ),
    );
  }
  Widget _buildBody2(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
//    ================================================================================
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? '' ,style: TextStyle(color: redColor,fontSize: width*.04),),
            subtitle: Text(_currentUser.email ?? '' ,style: TextStyle(color: grayColor,fontSize: width*.04),),
          ),

          heightSizedBox(context, .1),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: InkWell(onTap: () async {

                  print( " user name is : ${_currentUser.displayName}");
                  print( " user email is : ${_currentUser.email}");

                  final String email = _currentUser.email;
                  final String token = deviceToken;
                  final String mobile = "mobile";
                  final String name = _currentUser.displayName;
                  final UserModel user =
                  await createUser(email, token, mobile, name);
                  //--------------------------------------------------------------------------------- api function
                  setState(() {
                    _user = user;
                  });
//                    //--------------------------------------------------------------------------------------- if true go to home
                  if (_user.result == 'true') {
                    if (rememberMe == true) {
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.setString('email', _user.data[0]["email"]);
                      prefs.setString('name', _user.data[0]["name"]);
                    }

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext ctx) => Home()));
//    await StorageUtil.getInstance();
//    //--------------------------------------------------------------------------------------- to store id
//    StorageUtil.putStringId("key_id", _user.data[0]["id"]);
//    await StorageUtil.getInstance();
//    //--------------------------------------------------------------------------------------- to store email
//    StorageUtil.putStringEmail(
//    "key_email", _user.data[0]["email"]);
//                        ================================================================================== new shared
                    SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                    preferences.setString('name', _user.data[0]["name"]);
                    preferences.setString('email', _user.data[0]["email"]);
                    preferences.setString('mobile', _user.data[0]["mobile"]);
                    preferences.setString('password', _user.data[0]["password"]);
                    preferences.setString('id', _user.data[0]["id"]);
//                        ================================================================================== new shared

                    //--------------------------------------------------------------------------------------- to store password
//    StorageUtil.putStringPassword(
//    "key_password", _user.data[0]["password"]);
//    //--------------------------------------------------------------------------------------  to store name
//    StorageUtil.putStringName(
//    "key_name", _user.data[0]["name"]);
//    //-------------------------------------------------------------------------------------- to store phone
//    StorageUtil.putStringPhone(
//    "key_phone", _user.data[0]["mobile"]);
                    //  ================================================================== to clear email and password

//    emailController.clear();
//    passwordController.clear();

//                                ========================================================================================= else if result false
                  } else if (_user.result == 'false') {
                    Fluttertoast.showToast(
                      msg: _user.message,
                      backgroundColor: Colors.black,
                      fontSize: 10,
                    );
                  }
//                              ====================================================================================== the end of else condition
                  _firebaseMessaging.getToken().then((token) {
                    print('token is :${token}');
                    setState(() {
                      deviceToken = token;
                    }); // Print the Token in Console
                  });
                },
                  child: Container(
                      width: width * .6,
                      child: Center(
                        child: InkWell(
//                      =================================================== to send the application to server  =================================================

//                        ==============================================================
                            child: myText('متابعة', whiteColor, width*.03)),
                      ),
                      height: height * .07
                      ,
                      decoration: new BoxDecoration(
                          border: Border.all(color: redColor),
                          borderRadius: BorderRadius.circular(30),
                          color: redColor)),
                ),
              )
            ],
          ),

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
//              await createUser(email, token, mobile, name);
//              //--------------------------------------------------------------------------------- api function
//              setState(() {
//                _user = user;
//              });
////                    //--------------------------------------------------------------------------------------- if true go to home
//              if (_user.result == 'true') {
//                if (rememberMe == true) {
//                  SharedPreferences prefs =
//                  await SharedPreferences.getInstance();
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
//                await SharedPreferences.getInstance();
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
        heightSizedBox(context, .03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: InkWell(onTap: () {
                  _handleSignOut();
                },
                  child: Container(
                      width: width * .6,
                      child: Center(
                        child: InkWell(
//                      =================================================== to send the application to server  =================================================

//                        ==============================================================
                            child: myText('التسجيل بحساب آخر', whiteColor, width*.03)),
                      ),
                      height: height * .07
                      ,
                      decoration: new BoxDecoration(
                          border: Border.all(color: grayColor),
                          borderRadius: BorderRadius.circular(30),
                          color: grayColor)),
                ),
              )
            ],
          ),

        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(''),
          heightSizedBox(context, .1),



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: InkWell(onTap: () {
                  _handleSignIn();
                },
                  child: Container(
                      width: width * .6,
                      child: Center(
                        child: InkWell(
//                      =================================================== to send the application to server  =================================================

//                        ==============================================================
                            child: myText('تسجيل الدخول بحساب جوجل ', whiteColor, width*.03)),
                      ),
                      height: height * .07
                      ,
                      decoration: new BoxDecoration(
                          border: Border.all(color: redColor),
                          borderRadius: BorderRadius.circular(30),
                          color: redColor)),
                ),
              )
            ],
          ),

        ],
      );
    }
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }

  Widget _buildBody(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
//===================================================================================================== all text fields


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildBody2(context)
            ],
          )




//          ==============================================================================================================
//                                                   this part just  for debugging
//          ==============================================================================================================

          , heightSizedBox(context, .04),

        ],
      ),
    );
  }

  heightSizedBox(BuildContext context,double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * givenPercentage,
    );
  }

  widthSizedBox(BuildContext context,double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(width: width * givenPercentage);
  }

  iconContainer(givenIcon, givenColor, double givenSize) {
    return Icon(
      givenIcon,
      color: givenColor,
      size: givenSize,
    );
  }

  myText(String givenText, Color givenColor, double givenSize) {
    return Text(
      givenText,
      style: TextStyle(color: givenColor, fontSize: givenSize,fontFamily: 'ArbFONTS-59GE-SS-Two',fontWeight: FontWeight.bold),
    );
  }

  Widget radiusContainer(BuildContext context,String givenText, double givenPadding,String family ,type) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(

            width: width * .82,
            child: Center(
              child: InkWell(
                onTap: () {},
                child:
                //===================================================================================================== text field

                TextFormField(  keyboardType: type,
                  textDirection: TextDirection.ltr,textAlign: TextAlign.end,showCursor: false,
                  decoration: new InputDecoration(focusColor: redColor,icon: IconButton( icon: Icon(null,color:grayColor
                    ,textDirection: TextDirection.rtl,),onPressed: (){}
                    ,disabledColor: grayColor,focusColor: grayColor,),counterStyle: TextStyle(

                  ),
                    hintText: givenText,hintStyle: TextStyle(
                      fontSize: 12,fontFamily: family,
                    ), enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:
                      Colors.white.withOpacity(.0001)),
                    ),

                    labelStyle: new TextStyle(color: grayColor),
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.white,
                      ),
                    ),focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade900.withOpacity(.0001)),
                    ),
                  ),
                ) ,
              ),
            ),
            height: height * .07,
            padding: EdgeInsets.only(right: givenPadding),
            decoration: new BoxDecoration(
                border: Border.all(color:secondaryWhiteColor),
                borderRadius: BorderRadius.circular(30),
                color: secondaryWhiteColor)),
      ],
    );
  }
}


//========================================================================================================================= user model class

UserModel userModelFromJson(dynamic str) =>
    UserModel.fromJson(json.decode(str));
dynamic userModelToJson(UserModel data) => json.encode(data.toJson());

//========================================================================================================================= user model class
class UserModel {
  final String email;
  final String name;
  final String token;
  final String mobile;
  final String password;
  final String message;
  final String result;
  final dynamic data;
//===================================================================================================================================constructor
  UserModel({this.email,this.name,this.token,this.mobile, this.password, this.message, this.result, this.data});

  //===================================================================================================================================from json
  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
      email: json["email"],
      name: json["name"],
      mobile: json["mobile"],
      token: json["token"],
      password: json["password"],
      message: json["message"],
      result: json["result"],
      data: json["data"]

//    image: json["image"],
//   content: json['content'],
//    date: json['date']
  );
//=================================================================================================================================== to json
  Map<dynamic, dynamic> toJson() => {
    "email": email,
    "name": name,
    "mobile":mobile,
    "token": token,
    "password": password,
    "message": message,
    "result": result,
    "data": data
  };
}

//=============================================================================================


//=====================================================================================================

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
