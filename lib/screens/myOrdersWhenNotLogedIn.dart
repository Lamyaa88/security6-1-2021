//import 'package:flutter/material.dart';
//import 'package:security/screens/home.dart';
//
////=====================================================================================================
//
//class MyOrdersWhenNotLogedIn extends StatefulWidget {
//
//
//  @override
//
//  _MyOrdersWhenNotLogedInState createState() => _MyOrdersWhenNotLogedInState();
//
//}
//
//class _MyOrdersWhenNotLogedInState extends State<MyOrdersWhenNotLogedIn> {
//
//
//
//  static UserModel _user;
//  @override
//  void initState() {
//
//
//    super.initState();
//
//
//
//
//
//  }
//
//  @override
//
//
//  Widget build(BuildContext context) {
//
//
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//
//    return Scaffold(
//      backgroundColor: secondaryWhiteColor,
//      body: Stack(
//        children: <Widget>[
//          Container(
//            color: redColor,
//            height:height*.22,
//            child: Stack(
//
//              children: <Widget>[
//                Container(
//                    child: InkWell(
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//
//                        ],
//                      ),
//
//                    )
//
//                ),
//                Container(
//                    child:
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        heightSizedBox(context, .08),
//                        Row(
//
//
//                          children: <Widget>[
//
//
//                            widthSizedBox(context, .3),
//
//
//                            Text('طلباتي',style
//                                :TextStyle(fontSize:20,color: whiteColor
//                                ,letterSpacing: 1,fontFamily: 'ArbFONTS-59GE-SS-Two',fontWeight: FontWeight.bold
//                            ),
//
//                            ),
//                            widthSizedBox(context, .3),
//
//                            InkWell(
//                              child: iconContainer(Icons.arrow_forward, whiteColor, 20),onTap: () {
//                              Navigator.of(context).pushReplacement(
//                                  MaterialPageRoute(builder: (BuildContext context) => Home()));},
//                            ),
//                            widthSizedBox(context,.03),
//
//
//                          ],
//                          mainAxisAlignment: MainAxisAlignment.center,
//
//                        ),
//                        heightSizedBox(context, .04),
//
//
//                      ],
//                    )
//
//                )
//
//              ],
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 90),
//            child: Card(
//              //===================================================================================================== build body
//
//              child: _buildBody( context),
//              margin: EdgeInsets.fromLTRB(6.5,20, 6.5,0),
//              elevation:0,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(8)
//              ),
//              clipBehavior: Clip.antiAlias,
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget _buildBody(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
////===================================================================================================== all text fields
//
//
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: ListView(
//        children: <Widget>[
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//
//              Center(
//                child: myText( "لا يوجد طلبات لعرضها ",redColor,height*.02) ,
//              ),
//              heightSizedBox(context, .2),
////              Row(
////                mainAxisAlignment: MainAxisAlignment.center,
////                children: <Widget>[
////                  Container(
////                      width: width * .7,
////                      child: Center(
////                        child: InkWell(
////                            onTap: ()  {
////
////                            },
////                            child: myText('تسجيل الدخول ', whiteColor, 15)
////                        ),
////                      ),
////                      height: height * .075,
////                      padding: EdgeInsets.only(left: 1),
////                      decoration: new BoxDecoration(
////                          border: Border.all(color: redColor),
////                          borderRadius: BorderRadius.circular(30),
////                          color: redColor))
////                ],
////              ),
//
//            ],
//          )
//
//
//
//
////          ==============================================================================================================
////                                                   this part just  for debugging
////          ==============================================================================================================
//
//          , heightSizedBox(context, .04),
//
//        ],
//      ),
//    );
//  }
//
//  heightSizedBox(BuildContext context,double givenPercentage) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//    return SizedBox(
//      height: height * givenPercentage,
//    );
//  }
//
//  widthSizedBox(BuildContext context,double givenPercentage) {
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
//      style: TextStyle(color: givenColor, fontSize: givenSize,fontFamily: 'ArbFONTS-59GE-SS-Two',fontWeight: FontWeight.bold),
//    );
//  }
//
//  Widget radiusContainer(BuildContext context,String givenText, double givenPadding,String family ,type) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Container(
//
//            width: width * .82,
//            child: Center(
//              child: InkWell(
//                onTap: () {},
//                child:
//                //===================================================================================================== text field
//
//                TextFormField(keyboardType: type,
//                  textDirection: TextDirection.ltr,textAlign: TextAlign.end,showCursor: false,
//                  decoration: new InputDecoration(focusColor: redColor,icon: IconButton( icon: Icon(Icons.edit,color:grayColor
//                    ,textDirection: TextDirection.rtl,),onPressed: (){}
//                    ,disabledColor: grayColor,focusColor: grayColor,),counterStyle: TextStyle(
//
//                  ),
//                    hintText: givenText,hintStyle: TextStyle(
//                      fontSize: 12,fontFamily: family,
//                    ), enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color:
//                      Colors.white.withOpacity(.0001)),
//                    ),
//
//                    labelStyle: new TextStyle(color: grayColor),
//                    border: new UnderlineInputBorder(
//                      borderSide: new BorderSide(
//                        color: Colors.white,
//                      ),
//                    ),focusedBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: Colors.blue.shade900.withOpacity(.0001)),
//                    ),
//                  ),
//                ) ,
//              ),
//            ),
//            height: height * .07,
//            padding: EdgeInsets.only(right: givenPadding),
//            decoration: new BoxDecoration(
//                border: Border.all(color:secondaryWhiteColor),
//                borderRadius: BorderRadius.circular(30),
//                color: secondaryWhiteColor)),
//      ],
//    );
//  }
//}
//
//
////========================================================================================================================= user model class
//class UserModel {
//  final String email;
//  final String password;
//  final String message;
//  final String result;
//  final dynamic data;
////===================================================================================================================================constructor
//  UserModel({this.email, this.password, this.message, this.result, this.data});
//
//  //===================================================================================================================================from json
//  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
//      email: json["email"],
//      password: json["password"],
//      message: json["message"],
//      result: json["result"],
//      data: json["data"]
//
////    image: json["image"],
////   content: json['content'],
////    date: json['date']
//  );
////=================================================================================================================================== to json
//  Map<dynamic, dynamic> toJson() => {
//    "email": email,
//    "password": password,
//    "message": message,
//    "result": result,
//    "data": data
//  };
//}
////=====================================================================================================
//
//const whiteColor = Colors.white;
//const redColor = Color(0xff990000);
//const pinkColor = Colors.pink;
//const secondaryWhiteColor = Color(0xFFEEEEEE);
//const blackColor = Color(0xFF424242);
//const grayColor = Colors.grey;
