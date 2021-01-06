import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:security/screens/home.dart';
import 'package:security/screens/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../animated_navigation.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

//=========================================================================================================================== the model
class UserModel {
  String name;
  String mobile;
  String email;
  String password;
  String message;
  String result;
  //========================================================================================================================== constructor
  UserModel({
    this.name,
    this.mobile,
    this.email,
    this.password,
    this.message,
    this.result,
  });
  //============================================================================================================================from json

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json["name"],
      mobile: json["mobile"],
      email: json["email"],
      password: json["password"],
      message: json['message'],
      result: json['result']);
  //==============================================================================================================================to json

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "email": email,
        "password": password,
        'message': message,
        "result": result,
      };
}
//=================================================================================================================================== sign in

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
//===================================================================================================================================sign in state

  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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

//===================================================================================================================================
class CustomLogo extends StatefulWidget {
  @override
  _CustomLogoState createState() => _CustomLogoState();
}

class _CustomLogoState extends State<CustomLogo> {
  //===================================================================================================================================
  UserModel _user;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String loginId = " there is no id yet ";
  String deviceToken = "device token when signIn ";

//=================================================================================================================================== controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//===================================================================================================================================api function
  Future<UserModel> createUser(
      String name, String mobile, String email, String password,String token ) async {
    final String apiUrl = "http://n5ba.com/gaurds/the_json/register";

    final response = await http.post(apiUrl, body: {
      "name": name,
      "mobile": mobile,
      "email": email,
      "password": password,
      "token": token
//    "job": jobTitle
    });
    //===================================================================================================================================

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(response.body);

      return userModelFromJson(responseString);
    } else {
      return null;
    }
  }

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
                children: <Widget>[
                  InkWell(
                    child: iconContainer(Icons.arrow_back, whiteColor, 25),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                  )
                ],
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
                          image: AssetImage('assets/logo.png'),height: height*.2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              heightSizedBox(context, .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  myText('التسجيل', whiteColor, width*.045),
                  widthSizedBox(context, .13),
                ],
              ),
              //===========================================================================================================================alert dialog
//              _user == null
//                  ? Container()
//                  :
////                                                                   the message
//                  AlertDialog(
//                      backgroundColor: redColor,
//                      content: Text(
//                        _user.message,
//                        textDirection: TextDirection.rtl,
//                        style: TextStyle(
//                            color: whiteColor,
//                            fontFamily: 'ArbFONTS-59GE-SS-Two',
//                            fontSize: 10),
//                      ),
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(height * .05),
//                      ),
//                    ),
              //===================================================================================================================================
              heightSizedBox(context, .02),
              radiusContainer(context, 'الاسم', 15, false, _nameController , TextInputType.text),
              heightSizedBox(context, .02),
              heightSizedBox(context, .01),
              radiusContainer(
                  context, 'البريد الإلكتروني', 15, false, _emailController, TextInputType.emailAddress),
              heightSizedBox(context, .02),
              heightSizedBox(context, .02),
              radiusContainer(
                  context, 'رقم الجوال', 15, false, _mobileController , TextInputType.number),
              heightSizedBox(context, .02),
              heightSizedBox(context, .01),
              radiusContainer(
                  context, 'كلمة المرور', 15, true, _passwordController , TextInputType.text),
              heightSizedBox(context, .02),

//                ---------------------------------------------- end of the remember me row
              heightSizedBox(context, .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: width * .6,
                      child: Center(
                        child: InkWell(
                            onTap: () async {
                              final String name = _nameController.text;
                              final String mobile = _mobileController.text;
                              final String email = _emailController.text;
                              final String password = _passwordController.text;
                              final String token = deviceToken;



                              final UserModel user = await createUser(
                                  name, mobile, email, password ,token );

                              setState(() {
                                _user = user;
                              });
                              if (_user.result == 'true') {
                                Navigator.push(context,
                                    SlideFromRightPageRoute(widget: Login()));
                                Fluttertoast.showToast(msg: _user.message,backgroundColor: Colors.black,fontSize: height*.02, );

                              }else if (_user.result=="false"){
                                Fluttertoast.showToast(msg: _user.message,backgroundColor: Colors.black,fontSize: height*.02, );

                              }
                              _firebaseMessaging.getToken().then((token) {
                                print('token is :${token}');
                                setState(() {
                                  deviceToken = token ;

                                }
                                );// Print the Token in Console
                              }
                              );

                            },
                            child: myText('تسجيل الآن', whiteColor, 18)),
                      ),
                      height: height * .07,
                      padding: EdgeInsets.only(left: 1),
                      decoration: new BoxDecoration(
                          border: Border.all(color: redColor),
                          borderRadius: BorderRadius.circular(30),
                          color: redColor))
                ],
              ),
              heightSizedBox(context, .02),

//=======================================================the middle row

//                ------------------------------------the final row
              Container(width: width*.6,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
//                   ---------------------------------------------- on tap remember me text


                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              color: Color(0xffff6666),
                              fontSize: 15,
                              fontFamily: 'ArbFONTS-59GE-SS-Two'),
                        ),

//                   ---------------------------------------------- on tap forget password
                      ),

                      InkWell(
                        onTap: () {},
                        child: Text(
                          ' لديك حساب ؟',
                          style: TextStyle(
                              color: grayColor, fontFamily: 'ArbFONTS-59GE-SS-Two'),
                        ),

//                   ---------------------------------------------- on tap forget password
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  //=================================================================================================================================== radius container

  Widget radiusContainer(BuildContext context, String givenText,
      double givenPadding, secure, controller ,keyboardType) {
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
                    //=========================================================================================================================text field
                TextFormField(keyboardType: keyboardType,
                  cursorColor: Colors.blue,
                  enabled: true ,
                  keyboardAppearance: Brightness.light,autocorrect: false,
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

//=================================================================================================================================== height
  heightSizedBox(BuildContext context, double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * givenPercentage,
    );
  }

//=================================================================================================================================== width
  widthSizedBox(BuildContext context, double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(width: width * givenPercentage);
  }

//=================================================================================================================================== default text
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

//=================================================================================================================================== icon container
  iconContainer(givenIcon, givenColor, double givenSize) {
    return Icon(
      givenIcon,
      color: givenColor,
      size: givenSize,
    );
  }

//===================================================================================================================================circular avatar
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
}

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
