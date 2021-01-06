import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

//=====================================================================================================

Future<UserModel> createUser(
    String email) async {
  final String apiUrl = "http://n5ba.com/gaurds/the_json/login";

  final response = await http.post(apiUrl, body: {
    "email": email
  });

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(response.body);

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class ForgetPassword extends StatefulWidget {


  @override

  _ForgetPasswordState createState() => _ForgetPasswordState();

}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();



  static UserModel _user;
  @override
  void initState() {


    super.initState();





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
              heightSizedBox(context, 0.03),

              Center(
                child: myText( "من فضلك ادخل بريدك الإلكتروني ",redColor,height*.02) ,

              ),
              heightSizedBox(context, 0.03),


              radiusContainer(context, "", 0.03, "", TextInputType.emailAddress),
              heightSizedBox(context, 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(onTap: () async {
                    final String email = emailController.text ;

                    final UserModel user = await createUser(email) ;
                    setState(() {
                      _user = user;
                    });
                    if(_user.result=="true"){
                      Fluttertoast.showToast(msg:_user.message,backgroundColor: Colors.black,fontSize: height*.02,toastLength:
                      Toast.LENGTH_SHORT,gravity: ToastGravity.TOP );

                    }else if(_user.result=="false"){
                      Fluttertoast.showToast(msg:"تم الإرسال",backgroundColor: Colors.black,fontSize: height*.02, );

                    }
//                          if(_user.result=='true'){
//
//                            Navigator.push(
//                                context,
//                                SlideFromRightPageRoute(
//                                    widget: Home()
//                                )
//                            );
//
//                          }
                  },
                    child: Container(
                        width: width * .7,
                        child: Center(
                          child: InkWell(
//                      =================================================== to send the application to server  =================================================

//                        ==============================================================
                              child: myText('إرسال الآن', whiteColor, 15)),
                        ),
                        height: height * .075,
                        padding: EdgeInsets.only(left: 1),
                        decoration: new BoxDecoration(
                            border: Border.all(color: redColor),
                            borderRadius: BorderRadius.circular(30),
                            color: redColor)),
                  )
                ],
              ),



//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Container(
//                      width: width * .7,
//                      child: Center(
//                        child: InkWell(
//                            onTap: ()  {
//
//                            },
//                            child: myText('تسجيل الدخول ', whiteColor, 15)
//                        ),
//                      ),
//                      height: height * .075,
//                      padding: EdgeInsets.only(left: 1),
//                      decoration: new BoxDecoration(
//                          border: Border.all(color: redColor),
//                          borderRadius: BorderRadius.circular(30),
//                          color: redColor))
//                ],
//              ),

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

                TextFormField(controller: emailController,  keyboardType: type,
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

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

//===========================================================================================
class UserModel {
  String email;
  String message;
  String result;
//===========================================================================================
  UserModel({
    this.email,
    this.message,
    this.result,
  });
//===========================================================================================
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    message: json["message"],
    result: json["result"],

  );
//===========================================================================================
  Map<String, dynamic> toJson() => {
    "email": email,
    "message": message,
    "result": result,
  };
}

//=====================================================================================================

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
