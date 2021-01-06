///*  JoinUs
//  scaffold containing a build body and the upper part
//the function called build body is including all 8 text fields
//the function which  called radiusContainer is used to build every  single text field
//and one of it's parameters is controller which is used in backend .
//
// */
//
////======================================================================= libraries
//import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';
//import 'package:security/screens/home.dart';
//import 'package:security/screens/notifications.dart';
//import '../animated_navigation.dart';
//import 'package:dio/dio.dart';
//
////=========================================================================================== to send file
//
//Future<String> uploadImage(filename, url) async {
//  var request = http.MultipartRequest('POST', Uri.parse(url));
//  request.files.add(await http.MultipartFile.fromPath('picture', filename));
//  var res = await request.send();
//  return res.reasonPhrase;
//}
//
//String state = "";
//
////=========================================================================================== api function
//
//Future<UserModel> createUser(
//    //=========================================================================================== required parameters
//    String HYEJU,
//    String name,
//    String Gender,
//    String ID_NUM,
//    String E_MAIL,
//    String Mobile,
//    String address,
//    String cv) async {
//  final String apiUrl = "http://gaurds.n5ba.com/The_json/Application";
//  final response = await http.post(apiUrl, body: {
//    //=========================================================================================== body
//    "HYEJU": HYEJU,
//    "name": name,
//    "Gender": Gender,
//    "ID_NUM": ID_NUM,
//    "E_MAIL": E_MAIL,
//    "Mobile": Mobile,
//    "address": address,
//    "cv": cv
////===========================================================================================
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
////=========================================================================================== join us
//class JoinUs5 extends StatefulWidget {
//  JoinUs5({Key key, this.url}) : super(key: key);
//
//  final String url;
//  @override
//  _JoinUs5State createState() {
//    return _JoinUs5State();
//  }
//}
//
////=========================================================================================== state
//class _JoinUs5State extends State<JoinUs5> {
//  final TextEditingController _HYEJUController = TextEditingController();
//  final TextEditingController _nameController = TextEditingController();
//  final TextEditingController _ID_NUMController = TextEditingController();
//  final TextEditingController _GenderController = TextEditingController();
//  final TextEditingController _E_MAILController = TextEditingController();
//  final TextEditingController _Mobilecontroller = TextEditingController();
//  final TextEditingController _addressController = TextEditingController();
//  final TextEditingController _cvController = TextEditingController();
//
////=========================================================================================== user
//  UserModel _user;
//  //=========================================================================================== do you worked with us before
//  var languages = [
//    "                                                      لا",
//    "                                                نعم",
//    "هل سبق لك العمل بالشركة"
//  ];
//  var selectedLang = "هل سبق لك العمل بالشركة";
//  var selectedServise = "0";
//  //=========================================================================================== gender
//
//  var gender = ["ذكر", "أنثى", "النوع"];
//  var selectedGender = "النوع";
//  var selectedServiseGender = "0";
//
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    return Scaffold(
//      backgroundColor: secondaryWhiteColor,
//      body: Stack(
//        children: <Widget>[
//          Container(
//            color: redColor,
//            height: height * .22,
//            child: Stack(
//              children: <Widget>[
//                Container(
//                    child: InkWell(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[],
//                  ),
//                )),
//                Container(
//                    child: Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    heightSizedBox(context, .08),
//                    Row(
//                      children: <Widget>[
//                        InkWell(
//                          child: iconContainer(
//                              Icons.notifications, whiteColor, 20),
//                          onTap: () {
//                            Navigator.push(context,
//                                SlideFromTopRoute(widget: Notifications()));
//                          },
//                        ),
//                        widthSizedBox(context, .25),
//                        Text(
//                          'انضم إلينا',
//                          style: TextStyle(
//                              fontSize: 20,
//                              color: whiteColor,
//                              letterSpacing: 1,
//                              fontFamily: 'ArbFONTS-59GE-SS-Two',
//                              fontWeight: FontWeight.bold),
//                        ),
//                        widthSizedBox(context, .25),
//                        InkWell(
//                          child: iconContainer(
//                              Icons.arrow_forward, whiteColor, 20),
//                          onTap: () {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(builder: (context) => Home()),
//                            );
//                          },
//                        ),
//                        widthSizedBox(context, .03),
//                      ],
//                      mainAxisAlignment: MainAxisAlignment.center,
//                    ),
//                    heightSizedBox(context, .04),
//                  ],
//                ))
//              ],
//            ),
//          ),
////          =================================================== pading
//          Padding(
//            padding: const EdgeInsets.only(top: 90),
//            child: Card(
////              ===================================================== build body
//              child: _buildBody(context),
////              =====================================================
//              margin: EdgeInsets.fromLTRB(6.5, 20, 6.5, 0),
//              elevation: 0,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(8)),
//              clipBehavior: Clip.antiAlias,
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
////===========================================================================================build body
//  Widget _buildBody(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: ListView(
////        ================================================ all text fields  ================================================
//        children: <Widget>[
//          heightSizedBox(context, .02),
//          _user == null
//              ? Container()
//              : AlertDialog(
//                  backgroundColor: redColor,
//                  content: Container(
//                    child: Center(
//                      child: Text(
//                        _user.message,
//                        textDirection: TextDirection.rtl,
//                        style: TextStyle(
//                            color: whiteColor,
//                            fontFamily: 'ArbFONTS-59GE-SS-Two',
//                            fontSize: 10),
//                      ),
//                    ),
//                  ),
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(height * .05),
//                  ),
//                ),
////===========================================================================================
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                  width: width * .82,
//                  child: Center(
//                    child: InkWell(
//                      onTap: () {},
//                      child: Row(
//                        children: <Widget>[
//                          widthSizedBox(context, .35),
//                          DropdownButton<String>(
//                            icon: Icon(
//                              Icons.keyboard_arrow_down,
//                              color: secondaryWhiteColor,
//                              size: .00001111,
//                            ),
//                            underline: Container(),
//                            items: languages.map((String selectItem) {
//                              //=========================================================================================== drop down menu
//                              return DropdownMenuItem<String>(
//                                  value: selectItem,
//                                  child: Text(
//                                    selectItem,
//                                    style: TextStyle(
//                                      color: grayColor,
//                                      fontSize: height * .018,
//                                      fontFamily: 'ArbFONTS-59GE-SS-Two',
//                                    ),
//                                  ));
//                            }).toList(),
//                            onChanged: (String theLang) {
//                              setState(() {
//                                selectedLang = theLang;
//                                selectedServise =
//                                    languages.indexOf(selectedLang).toString();
//                              });
//                              print(languages.indexOf(selectedLang).toString());
//                            },
//                            value: selectedLang,
//                          ),
//                          Container(
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                Text(
//                                  "",
//                                  style: TextStyle(
//                                    color: grayColor,
//                                    fontSize: height * .018,
//                                    fontFamily: 'ArbFONTS-59GE-SS-Two',
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  height: height * .07,
//                  padding: EdgeInsets.only(right: 0),
//                  decoration: new BoxDecoration(
//                      border: Border.all(color: secondaryWhiteColor),
//                      borderRadius: BorderRadius.circular(30),
//                      color: secondaryWhiteColor)),
//            ],
//          ),
//
//          heightSizedBox(context, .017),
//
//          radiusContainer(context, 'الاسم', 10, 'ArbFONTS-59GE-SS-Two', null,
//              _nameController, TextInputType.text),
//          heightSizedBox(context, .017),
//          radiusContainer(
//              context,
//              'رقم السجل المدني',
//              10,
//              'ArbFONTS-59GE-SS-Two',
//              null,
//              _ID_NUMController,
//              TextInputType.number),
//
//          heightSizedBox(context, .017),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                  width: width * .82,
//                  child: Center(
//                    child: InkWell(
//                      onTap: () {},
//                      child: Row(
//                        children: <Widget>[
//                          widthSizedBox(context, .7),
//                          DropdownButton<String>(
//                            icon: Icon(
//                              Icons.keyboard_arrow_down,
//                              color: secondaryWhiteColor,
//                              size: .00001111,
//                            ),
//                            underline: Container(),
//                            items: gender.map((String selectItem) {
//                              return DropdownMenuItem<String>(
//                                  value: selectItem,
//                                  child: Text(
//                                    selectItem,
//                                    style: TextStyle(
//                                      color: grayColor,
//                                      fontSize: height * .018,
//                                      fontFamily: 'ArbFONTS-59GE-SS-Two',
//                                    ),
//                                  ));
//                            }).toList(),
//                            onChanged: (String theGender) {
//                              setState(() {
//                                selectedGender = theGender;
//                                selectedServiseGender = languages
//                                    .indexOf(selectedGender)
//                                    .toString();
//                              });
//                              print(
//                                  (gender.indexOf(selectedGender)).toString());
//                            },
//                            value: selectedGender,
//                          ),
//                          Container(
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                Text(
//                                  "",
//                                  style: TextStyle(
//                                    color: grayColor,
//                                    fontSize: height * .018,
//                                    fontFamily: 'ArbFONTS-59GE-SS-Two',
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  height: height * .07,
//                  padding: EdgeInsets.only(right: 0),
//                  decoration: new BoxDecoration(
//                      border: Border.all(color: secondaryWhiteColor),
//                      borderRadius: BorderRadius.circular(30),
//                      color: secondaryWhiteColor)),
//            ],
//          ),
//
//          heightSizedBox(context, .017),
//          radiusContainer(
//              context,
//              'البريد الإلكتروني',
//              10,
//              'ArbFONTS-59GE-SS-Two',
//              null,
//              _E_MAILController,
//              TextInputType.emailAddress),
//          heightSizedBox(context, .017),
//
//          radiusContainer(context, 'رقم الجوال', 10, 'ArbFONTS-59GE-SS-Two',
//              null, _Mobilecontroller, TextInputType.number),
//          heightSizedBox(context, .017),
//          radiusContainer(context, 'العنوان', 10, 'ArbFONTS-59GE-SS-Two', null,
//              _addressController, TextInputType.text),
//          heightSizedBox(context, .017),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                  width: width * .82,
//                  child: Center(
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.end,
//                      children: <Widget>[
//                        RaisedButton(
//                          onPressed:  () async {
//                            var file =
//
//                            await ImagePicker.pickImage(source: ImageSource.gallery);
//                            var res = await uploadImage(file.path, widget.url);
//                            setState(() {
//                              state = res;
//                              print("pass is :::::{res}");
//                            });
//                          },
//                          child: Icon(
//                            Icons.insert_drive_file,
//                            color: grayColor,
//                          ),
//                          color: secondaryWhiteColor,
//                          elevation: 0,
//                          padding: EdgeInsets.only(right: height * .09),
//                        ),
//                        widthSizedBox(context, .3),
//                        Text(
//                          "السيرة الذاتية ",
//                          style: TextStyle(
//                              color: grayColor,
//                              fontFamily: 'ArbFONTS-59GE-SS-Two',
//                              fontSize: height * .018),
//                        ),
//                        widthSizedBox(context, .02),
//                      ],
//                    ),
//                  ),
//                  height: height * .07,
//                  padding: EdgeInsets.only(),
//                  decoration: new BoxDecoration(
//                      border: Border.all(color: secondaryWhiteColor),
//                      borderRadius: BorderRadius.circular(30),
//                      color: secondaryWhiteColor)),
//            ],
//          ),
////=============================================================================================================================
//
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                  width: width * .7,
//                  child: Center(
//                    child: InkWell(
////                      =================================================== to send the application to server  =================================================
//                        onTap: () async {
//                          final String HYEJU =
//                              languages.indexOf(selectedLang).toString();
//                          final String name = _nameController.text;
//                          final String ID_NUM = _ID_NUMController.text;
//                          final String Gender =
//                              gender.indexOf(selectedGender).toString();
//                          final String E_MAIL = _E_MAILController.text;
//                          final String Mobile = _Mobilecontroller.text;
//                          final String address = _addressController.text;
//                          final String cv = state;
//
//                          final UserModel user = await createUser(HYEJU, name,
//                              ID_NUM, Gender, E_MAIL, Mobile, address, cv);
//
//                          setState(() {
//                            _user = user;
//                          });
////                          if(_user.result=='true'){
////
////                            Navigator.push(
////                                context,
////                                SlideFromRightPageRoute(
////                                    widget: Home()
////                                )
////                            );
////
////                          }
//                        },
////                        ==============================================================
//                        child: myText('إرسال الآن', whiteColor, 15)),
//                  ),
//                  height: height * .075,
//                  padding: EdgeInsets.only(left: 1),
//                  decoration: new BoxDecoration(
//                      border: Border.all(color: redColor),
//                      borderRadius: BorderRadius.circular(30),
//                      color: redColor))
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//
////============================================================== sized box
//
//  heightSizedBox(BuildContext context, double givenPercentage) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//    return SizedBox(
//      height: height * givenPercentage,
//    );
//  }
//
////==================================================================================================================defaultWidthSizedBox
//  widthSizedBox(BuildContext context, double givenPercentage) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//    return SizedBox(width: width * givenPercentage);
//  }
//
//  iconContainer(givenIcon, givenColor, double givenSize) {
//    return Icon(
//      givenIcon,
//      color: givenColor,
//      size: givenSize,
//    );
//  }
//
//  myText(String givenText, Color givenColor, double givenSize) {
//    return Text(
//      givenText,
//      style: TextStyle(
//          color: givenColor,
//          fontSize: givenSize,
//          fontFamily: 'ArbFONTS-59GE-SS-Two',
//          fontWeight: FontWeight.bold),
//    );
//  }
//
////  =============================================================================================================================== a widget to build text field
//  Widget radiusContainer(BuildContext context, String givenText,
//      double givenPadding, String family, lable, controller, type) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Container(
//            width: width * .82,
//            child: Center(
//              child: InkWell(
//                onTap: () {},
//                child: TextFormField(
//                  keyboardType: type,
//                  controller: controller,
//                  textDirection: TextDirection.ltr,
//                  textAlign: TextAlign.end,
//                  showCursor: true,
//                  decoration: new InputDecoration(
//                    focusColor: redColor,
//                    icon: IconButton(
//                      icon: Icon(
//                        lable,
//                        color: grayColor,
//                        textDirection: TextDirection.rtl,
//                      ),
//                      onPressed: () {},
//                      disabledColor: grayColor,
//                      focusColor: grayColor,
//                    ),
//                    counterStyle: TextStyle(),
//                    hintText: givenText,
//                    hintStyle: TextStyle(
//                        fontSize: 12, fontFamily: family, color: grayColor),
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide:
//                          BorderSide(color: Colors.white.withOpacity(.0001)),
//                    ),
//                    labelStyle: new TextStyle(color: grayColor),
//                    border: new UnderlineInputBorder(
//                      borderSide: new BorderSide(
//                        color: Colors.white,
//                      ),
//                    ),
//                    focusedBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(
//                          color: Colors.blue.shade900.withOpacity(.0001)),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            height: height * .07,
//            padding: EdgeInsets.only(right: givenPadding),
//            decoration: new BoxDecoration(
//                border: Border.all(color: secondaryWhiteColor),
//                borderRadius: BorderRadius.circular(30),
//                color: secondaryWhiteColor)),
//      ],
//    );
//  }
////  ============================================================================================== end of the widget
//}
////===========================================================================================??????????????????????
//
//UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
//
//String userModelToJson(UserModel data) => json.encode(data.toJson());
//
////===========================================================================================
//class UserModel {
//  String HYEJU;
//  String name;
//  String ID_NUM;
//  String Gender;
//  String E_MAIL;
//  String Mobile;
//  String address;
//  String cv;
//  String message;
//  String result;
////===========================================================================================
//  UserModel({
//    this.HYEJU,
//    this.name,
//    this.ID_NUM,
//    this.Gender,
//    this.E_MAIL,
//    this.Mobile,
//    this.address,
//    this.cv,
//    this.message,
//    this.result,
//  });
////===========================================================================================
//  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//        HYEJU: json["HYEJU"],
//        name: json["name"],
//        ID_NUM: json["ID_NUM"],
//        Gender: json["Gender"],
//        E_MAIL: json["E_MAIL"],
//        Mobile: json["Mobile"],
//        address: json["address"],
//        cv: json["cv"],
//        message: json["message"],
//        result: json["result"],
//      );
////===========================================================================================
//  Map<String, dynamic> toJson() => {
//        "HYEJU": HYEJU,
//        "name": name,
//        "ID_NUM": ID_NUM,
//        "Gender": Gender,
//        "E_MAIL": E_MAIL,
//        "Mobile": Mobile,
//        "address": address,
//        "cv": cv,
//        "message": message,
//        "result": result,
//      };
//}
//
////===========================================================================================
//const whiteColor = Colors.white;
//const redColor = Color(0xff990000);
//const pinkColor = Colors.pink;
//const secondaryWhiteColor = Color(0xFFEEEEEE);
//const blackColor = Color(0xFF424242);
//const grayColor = Colors.grey;
