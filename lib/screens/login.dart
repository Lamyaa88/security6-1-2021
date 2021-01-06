import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:security/screens/forgetPassword.dart';
import 'package:security/screens/home.dart';
import 'package:security/animated_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:security/screens/loginWithFacebook.dart';
import 'package:security/screens/loginWithGoogle.dart';
import 'package:security/screens/loginWithTwitter.dart';
import 'package:security/screens/siginIn.dart';
import 'package:security/test/facebook.dart';
import 'package:security/test/twitter.dart';
import 'package:security/test/google.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';


UserModel userModelFromJson(dynamic str) =>
    UserModel.fromJson(json.decode(str));
dynamic userModelToJson(UserModel data) => json.encode(data.toJson());

//========================================================================================================================= user model class
class UserModel {
  final String email;
  final String password;
  final String message;
  final String result;
  final dynamic data;
//===================================================================================================================================constructor
  UserModel({this.email, this.password, this.message, this.result, this.data});

  //===================================================================================================================================from json
  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
      email: json["email"],
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
        "password": password,
        "message": message,
        "result": result,
        "data": data
      };
}

//========================================================================================================================================= login
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//=================================================================================================================================== login state
class _LoginState extends State<Login> {
  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage('assets/splash.png'),
                        fit: BoxFit.fill)),
              ),
              //=================================================================================================================================== the logo
              CustomLogo(),
            ],
          ),
        ),
      ),
    );
  }

  //=================================================================================================================================== radius container
  customRadiusContainer(String givenText, double givenPadding) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            width: width * .8,
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Text(
                  givenText,
                  style: TextStyle(
                      color: grayColor, fontSize: 12, fontFamily: 'jf'),
                ),
              ),
            ),
            height: height * .07,
            padding: EdgeInsets.only(left: givenPadding),
            decoration: new BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(30),
                color: whiteColor))
      ],
    );
  }
}

class CustomLogo extends StatefulWidget {
  //=================================================================================================================================== api function
//  Future<UserModel> createUser(String email, String password) async {
//    final String apiUrl = "http://n5ba.com/gaurds/the_json/login";
//
//    final response = await http.post(apiUrl, body: {
//      "email": email,
//      "password": password
////    "job": jobTitle
//    });
//
//    if (response.statusCode == 200) {
//      final String responseString = response.body;
//      print(response.body);
//
//      return userModelFromJson(responseString);
//    } else {
//      return null;
//    }
//  }

  @override
  _CustomLogoState createState() => _CustomLogoState();
}

class _CustomLogoState extends State<CustomLogo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static UserModel _user;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  String loginId = " there is no id yet ";
  String deviceToken = "there is no token ";
  bool rememberMe = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<UserModel> createUser(
      String email, String password, String token) async {
    final String apiUrl = "http://n5ba.com/gaurds/the_json/login";

    final response = await http.post(apiUrl, body: {
      "email": email,
      "password": password,
      "token": token,

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
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    setState(() {
//
//    });
//    emailController.dispose();
//    passwordController.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              heightSizedBox(context, .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .25,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/logo.png'),height: height*.2
                          ,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              heightSizedBox(context, .03),
              //================================================================================ alert dialog after login
//              _user == null
//                  ? Container(
//                      child: Container(),
//                    )
//                  : AlertDialog(
//                      backgroundColor: redColor,
//                      content: Center(
////                ==================================================================== the message which will be sent from api
//                        child: Text(
//                          _user.message,
//                          textDirection: TextDirection.rtl,
//                          style: TextStyle(
//                              color: whiteColor,
//                              fontFamily: 'ArbFONTS-59GE-SS-Two',
//                              fontSize: 11),
//                        ),
//                      ),
//                      actions: <Widget>[],
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(height * .05),
//                      ),
//                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 32,
                  ),
                  myText('تسجيل الدخول', whiteColor, width*.04),
                  widthSizedBox(context, .12
                  ),
                ],
              ),

              heightSizedBox(context, .02),
              radiusContainer(
                  context, ' البريد الالكتروني ', 15, false, emailController , TextInputType.emailAddress,),

              heightSizedBox(context, .02),
              heightSizedBox(context, .01),
              radiusContainer(
                  context, ' كلمة المرور', 15, true, passwordController , TextInputType.text),
              heightSizedBox(context, .02),
              Container(width: width*.75,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgetPassword()),
                          );

                        },
                        child: Text(
                          'هل نسيت كلمة المرور ؟',
                          style: TextStyle(
                              color: grayColor, fontFamily: 'ArbFONTS-59GE-SS-Two' ,fontSize: width*.03),
                        ),

//                   ---------------------------------------------- on tap forget password
                      ),
                      widthSizedBox(context, .05),

                      InkWell(
                        onTap: () {},
                        child: Text(
                          'تذكرني',
                          style: TextStyle(
                              color: grayColor, fontFamily: 'ArbFONTS-59GE-SS-Two' ,fontSize: width*.03),
                        ),

//                   ---------------------------------------------- on tap remember me text
                      ),
                      Container(
                        height: 18,
                        width: 18,
                        color: grayColor,
                        child: Checkbox(
                            value: rememberMe,
                            onChanged: (bool newValue) {
                              setState(() {
                                rememberMe = newValue;
                                print("remember me is true ");
                              });
                            }),
                      ),

                    ],
                  ),
                ),
              ),
//                ---------------------------------------------- end of the remember me row
              heightSizedBox(context, .03),
              Container(
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: whiteColor,
                  child: InkWell(
                    splashColor: whiteColor,
                    radius: 30,
                    onTap: () async {
                      final String email = emailController.text;
                      final String password = passwordController.text;
                      final String token = deviceToken;

                      final UserModel user =
                          await createUser(email, password, token);
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

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext ctx) => Home()));
                        await StorageUtil.getInstance();
                        //--------------------------------------------------------------------------------------- to store id
                        StorageUtil.putStringId("key_id", _user.data[0]["id"]);
                        await StorageUtil.getInstance();
                        //--------------------------------------------------------------------------------------- to store email
                        StorageUtil.putStringEmail(
                            "key_email", _user.data[0]["email"]);
//                        ================================================================================== new shared
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        preferences.setString('name', _user.data[0]["name"]);
                        preferences.setString('email', _user.data[0]["email"]);
                        preferences.setString('mobile', _user.data[0]["mobile"]);
                        preferences.setString('password', _user.data[0]["password"]);
                        preferences.setString('id', _user.data[0]["id"]);
//                        ================================================================================== new shared

                        //--------------------------------------------------------------------------------------- to store password
                        StorageUtil.putStringPassword(
                            "key_password", _user.data[0]["password"]);
                        //--------------------------------------------------------------------------------------  to store name
                        StorageUtil.putStringName(
                            "key_name", _user.data[0]["name"]);
                        //-------------------------------------------------------------------------------------- to store phone
                        StorageUtil.putStringPhone(
                            "key_phone", _user.data[0]["mobile"]);
                        //  ================================================================== to clear email and password

                        emailController.clear();
                        passwordController.clear();

//                                ========================================================================================= else if result false
                      } else if (_user.result == 'false') {
                        Fluttertoast.showToast(
                          msg: _user.message,
                          backgroundColor: Colors.black,
                          fontSize: height * .02,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: width * .6,
                            child: Center(
                              child: InkWell(

                                  //=============================================================send login info _ keep id _ send token _
//

                                  child:
                                      myText('تسجيل الدخول', whiteColor, 18)),
                            ),
                            height: height * .07,
                            padding: EdgeInsets.only(left: 1),
                            decoration: new BoxDecoration(
                                border: Border.all(color: redColor),
                                borderRadius: BorderRadius.circular(30),
                                color: redColor))
                      ],
                    ),
                  ),
                ),
              ),
              heightSizedBox(context, .02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'أو الدخول ب',
                      style: TextStyle(
                          color: grayColor,
                          fontFamily: 'ArbFONTS-59GE-SS-Two',
                          fontSize: 12),
                    ),

//                   ---------------------------------------------- on tap forget password
                  ),
                ],
              ),
              heightSizedBox(context, .02),
//=======================================================the middle row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  myCircularAvatar(20, 'assets/facebook.png', () {
                    Navigator.push(
                        context, SlideFromLeftPageRoute(widget:LoginWithFacebook()));}),
                  widthSizedBox(context, .1),
                  myCircularAvatar(20, 'assets/google.png', () {
                    Navigator.push(
                        context, SlideFromTopRoute(widget: LoginWithGoogle()));
                  }),
                  widthSizedBox(context, .1),
                  myCircularAvatar(20, 'assets/twitter.png', () {
                    Navigator.push(
                        context, SlideFromRightPageRoute(widget: LoginWithTwitter()));
                  }),
                ],
              ),
              heightSizedBox(context, .02),

//                ------------------------------------the final row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                   ---------------------------------------------- on tap remember me text

                  widthSizedBox(context, .04),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, SlideFromLeftPageRoute(widget: SignIn()));
//                      =========================================================================================== clearing password
                      emailController.clear();
                      passwordController.clear();
                      // =========================================================================================== clearing password and email
                    },
                    child: Text(
                      'تسجيل حساب جديد',
                      style: TextStyle(
                          color: Color(0xffff6666),
                          fontSize: 15,
                          fontFamily: 'ArbFONTS-59GE-SS-Two'),
                    ),

//                   ---------------------------------------------- on tap forget password
                  ),
                  widthSizedBox(context, .05),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "ليس لديك حساب ",
                      style: TextStyle(
                          color: grayColor, fontFamily: 'ArbFONTS-59GE-SS-Two'),
                    ),

//                   ---------------------------------------------- on tap forget password
                  ),
                ],
              ),
            ],
          ),
//          heightSizedBox(context, .08),
//          Text(deviceToken,style: TextStyle(color: whiteColor),),
        ],
      ),
    );
  }

  Widget radiusContainer(BuildContext context, String givenText,
      double givenPadding, secure, controller , keyboard) {
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
                //=================================================================================================================== text field
                child: TextFormField(keyboardType:keyboard ,
                  cursorColor: Colors.blue,
                  enabled: true,
                  keyboardAppearance: Brightness.light, autocorrect: false,
                  //==================================================================================================================controller
                  controller: controller,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.end,
                  showCursor: true,

//                  autofocus: true,
                  obscureText: secure,
//                  cursorColor: secondaryWhiteColor.withOpacity(.0001),
                  cursorWidth: 3,
//                  enableInteractiveSelection: true,
                  textInputAction: TextInputAction.next,
                  decoration: new InputDecoration(
                    focusColor: blackColor,
                    hintText: givenText,
                    hintStyle: TextStyle(
                        fontSize: 12, fontFamily: 'ArbFONTS-59GE-SS-Two'),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(.0001)),
                    ),
                    labelStyle: new TextStyle(color: redColor),
                    hasFloatingPlaceholder: false,
                    isDense: false,
                    hoverColor: redColor,
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                        color: redColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blue.shade900.withOpacity(.0001)),
                    ),
                  ),
                ),
              ),
            ),
            height: height * .07,
            padding: EdgeInsets.only(right: givenPadding),
            decoration: new BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
                color: whiteColor)),
      ],
    );
  }

  heightSizedBox(BuildContext context, double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * givenPercentage,
    );
  }

  widthSizedBox(BuildContext context, double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(width: width * givenPercentage);
  }

  myText(String givenText, Color givenColor, double givenSize) {
    return Text(
      givenText,
      style: TextStyle(
          color: givenColor,
          fontSize: givenSize,
          fontFamily: 'ArbFONTS-59GE-SS-Two',
          fontWeight: FontWeight.bold),
    );
  }

  iconContainer(givenIcon, givenColor, double givenSize) {
    return Icon(
      givenIcon,
      color: givenColor,
      size: givenSize,
    );
  }

  myCircularAvatar(double givenRadius, String givenPath, onTap) {
    return Container(
        child: InkWell(
      child: Center(
        child: CircleAvatar(
          radius: givenRadius,
          backgroundImage: AssetImage(givenPath),
          backgroundColor: whiteColor,
        ),
      ),
      onTap: onTap,
    ));
  }

//================================================================================ to replace LoginId with actual user id when he logged in
  String theIdWhichRecieved() {
    if (_user.result == "true") {
      setState(() {
        loginId = _user.data[0]["id"];
      });
    } else if (_user.result == "false") {
      setState(() {
        loginId = "no id yet ";
      });
    }
  }
}

//========================================================================================================================= shared pref.
class StorageUtil {
  static StorageUtil _storageUtil;
  static SharedPreferences _preferences;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtil._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }
//===========================================================================================================
//                                      to get  values
//===========================================================================================================
  //  --------------------------------------------------------------------------------------------------------------------   id  -----

  static String getStringId(String key1, {String defValue1 = ""}) {
    if (_preferences == null) return defValue1;
    return _preferences.getString(key1) ?? defValue1;
  }

//  ----------------------------------------------------------------------------------------------------------------------   email   --
  static String getStringEmail(String key2, {String defValue2 = ""}) {
    if (_preferences == null) return defValue2;
    return _preferences.getString(key2) ?? defValue2;
  }
  //  -----------------------------------------------------------------------------------------------------------------     password  ---

  static String getStringPassword(String keyPassword,
      {String defValuePassword = ""}) {
    if (_preferences == null) return defValuePassword;
    return _preferences.getString(keyPassword) ?? defValuePassword;
  }
  //  ----------------------------------------------------------------------------------------------------------------------   name  ---

  static String getStringName(String keyName, {String defValueName = ""}) {
    if (_preferences == null) return defValueName;
    return _preferences.getString(keyName) ?? defValueName;
    //  ---------------------------------------------------------------------------------------------------------------------  phone  ---
  }

  static String getStringPhone(String keyPhone, {String defValuePhone = ""}) {
    if (_preferences == null) return defValuePhone;
    return _preferences.getString(keyPhone) ?? defValuePhone;
  }

//============================================================================================================
//                                       to put values
//============================================================================================================
  //  ---------------------------------------------------------------------------------------------------------------------- id  -------

  static Future<bool> putStringId(String key1, String value1) {
    if (_preferences == null) return null;
    return _preferences.setString(key1, value1);
  }
  //  ---------------------------------------------------------------------------------------------------------------------- name  -------

  static Future<bool> putStringEmail(String key2, String value2) {
    if (_preferences == null) return null;
    return _preferences.setString(key2, value2);
  }
  //  -------------------------------------------------------------------------------------------------------------------------  password  ----

  static Future<bool> putStringPassword(
      String keyPassword, String valuePassword) {
    if (_preferences == null) return null;
    return _preferences.setString(keyPassword, valuePassword);
  }
  //  --------------------------------------------------------------------------------------------------------------------------  name ---

  static Future<bool> putStringName(String keyName, String valueName) {
    if (_preferences == null) return null;
    return _preferences.setString(keyName, valueName);

    //  --------------------------------------------------------------------------------------------------------------------------  name ---
  }

  static Future<bool> putStringPhone(String keyPhone, String valuePhone) {
    if (_preferences == null) return null;
    return _preferences.setString(keyPhone, valuePhone);
  }

//============================================================================================================
//                                           to clear values
//============================================================================================================
  static Future<bool> clrStringId() {
    SharedPreferences prefsId = _preferences;
    prefsId.clear();
  }
  //  -----------------------------------------------------------------------------------------------------------------------------

  static Future<bool> clrStringEmail() {
    SharedPreferences prefsEmail = _preferences;
    prefsEmail.clear();
  }
  //  -----------------------------------------------------------------------------------------------------------------------------

  static Future<bool> clrStringpassword() {
    SharedPreferences prefsPassword = _preferences;
    prefsPassword.clear();
  }
  //  -----------------------------------------------------------------------------------------------------------------------------

  static Future<bool> clrStringName() {
    SharedPreferences prefsName = _preferences;
    prefsName.clear();
  }
  //  -----------------------------------------------------------------------------------------------------------------------------

  static Future<bool> clrStringPhone() {
    SharedPreferences prefsPhone = _preferences;
    prefsPhone.clear();
  }
//  -----------------------------------------------------------------------------------------------------------------------------

}

//===================================================================================================================================

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
