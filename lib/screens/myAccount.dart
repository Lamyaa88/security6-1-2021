import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:security/screens/home.dart';
import 'package:security/animated_navigation.dart';
import 'package:security/test/test6.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'notifications.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';

//=====================================================================================================

class MyAccount extends StatefulWidget {


  @override

  _MyAccountState createState() => _MyAccountState();

}

class _MyAccountState extends State<MyAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  Map mapResponse;
  List notificationDetails ;
  Future<UserModel> getAllNotifications(String id,String name,String email ,String mobile,[String password]
      ) async {
    final String apiUrl = "http://n5ba.com/gaurds/the_json/update_customer";
    final response = await http.post(apiUrl, body: {
      //=========================================================================================== required parameter
      "id": id,
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,


      //===========================================================================================
    });

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(response.body);
      setState(() {
        mapResponse = json.decode(response.body);
        print(mapResponse);

      });





      return userModelFromJson(responseString);
    } else {
      return null;
    }
  }

//  ==========================================================================
  String emailSession = "";
  String nameSession = "";
  String mobileSession = "";
  String passwordSession = "";
  String idSession = "";


  Future getEmail()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      emailSession = preferences.getString('email');
    });
  }
  Future getName()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
     nameSession = preferences.getString('name');
    });
  }
  Future getMobile()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      mobileSession = preferences.getString('mobile');
    });
  }
  Future getPassword()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
     passwordSession = preferences.getString('password');
    });
  }
  Future getId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      idSession = preferences.getString('id');
    });
  }




  static UserModel _user;

  var pref =  SharedPreferences.getInstance();


  @override
  void initState() {

    getEmail();
    getName();
    getMobile();
    getPassword();
    getId();
    print(emailSession);
    print(nameSession);
    print(mobileSession);
    print(passwordSession);
    print(idSession);

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

                            InkWell(
                              child: iconContainer(Icons.notifications, whiteColor, 20),onTap: () {
                              Navigator.push(
                                  context,
                                  SlideFromTopRoute(
                                      widget: Notifications6(idSession)
                                  )
                              );
                            },

                            ),
                            widthSizedBox(context, .3),


                            Text('حسابي',style
                                :TextStyle(fontSize:20,color: whiteColor
                                ,letterSpacing: 1,fontFamily: 'ArbFONTS-59GE-SS-Two',fontWeight: FontWeight.bold
                            ),

                            ),
                            widthSizedBox(context, .3),

                            InkWell(
                              child: iconContainer(Icons.arrow_forward, whiteColor, 20),onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (BuildContext context) => Home()));
                              },
                            ),
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
          radiusContainer(context, nameSession, 10,'' ,TextInputType.text , nameController),
          heightSizedBox(context, .02
          ),
          radiusContainer(context, emailSession, 10,'',TextInputType.emailAddress ,emailController),
          heightSizedBox(context, .02
          ),
          radiusContainer(context, mobileSession, 10,'',TextInputType.number,mobileController),

          heightSizedBox(context, .02
          ),
          radiusContainer(context,"**********", 10,'',TextInputType.text , passwordController),
          heightSizedBox(context, .04

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: width * .7,
                  child: Center(
                    child: InkWell(
//                      ============================================================================ update .
                      onTap: () async {
                        final String id = idSession ;
                        final String name = nameController.toString();
                        final String phone = mobileController.toString();
                        final String email = emailController.toString();
                        final String password = passwordController.toString();
                        final UserModel user = await getAllNotifications(
                           id, name, phone, email,password );
                        setState(() {
                          _user = user;
                        });
                        if(_user.result=="true"){
                          Fluttertoast.showToast(msg:_user.message,backgroundColor: Colors.black,fontSize: height*.02, );
//                            _nameecontroller.clear();
//                            _phonecontroller.clear();
//                            _emailcontroller.clear();
//                            _addresscontroller.clear();
//                            _messagecontroller.clear();
                        }else if(_user.result=="false"){
                          Fluttertoast.showToast(msg:"من فضلك ادخل جميع الحقول ",backgroundColor: Colors.black,fontSize: height*.02, );


                        }

//                          =================================================================================================== to dispose  the fields

                      },
                      child: Container(
                          width: width * .7,
                          child: Center(
                            child: InkWell(
                              //=========================================================================================== on tap : sending the order

                              //=========================================================================================== send
                                child: myText('تحديث', whiteColor, 15)),
                          ),
                          height: height * .075,
                          padding: EdgeInsets.only(left: 1),
                          decoration: new BoxDecoration(
                              border: Border.all(color: redColor),
                              borderRadius: BorderRadius.circular(30),
                              color: redColor)),
                    ),
                  ),
                  height: height * .075,
                  padding: EdgeInsets.only(left: 1),
                  decoration: new BoxDecoration(
                      border: Border.all(color: redColor),
                      borderRadius: BorderRadius.circular(30),
                      color: redColor))
            ],
          ),
//
          heightSizedBox(context, .04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell( onTap: () async {
//-=======================================================================================================
                SharedPreferences preferences = await SharedPreferences.getInstance();
                preferences.remove('name');
                preferences.remove('email');
                preferences.remove('mobile');
                preferences.remove('password');
                preferences.remove('id');
//                ===========================================================
                await StorageUtil.getInstance();
                //---------------------------------------------------------------------------------------  to clear id
                StorageUtil.clrStringId();
                await StorageUtil.getInstance();
                //---------------------------------------------------------------------------------------  to clear email
                StorageUtil.clrStringEmail();
                //---------------------------------------------------------------------------------------  to clear password
                StorageUtil.clrStringpassword();
                //--------------------------------------------------------------------------------------   to clear name
                StorageUtil.clrStringName();
                //--------------------------------------------------------------------------------------   to clear phone
                StorageUtil.clrStringPhone();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('email');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => Login()));
              },
                child: Container(
                    width: width * .7,
                    child: Center(
                      child: InkWell(

                          child: myText('تسجيل الخروج ', whiteColor, 15)
                      ),
                    ),
                    height: height * .075,
                    padding: EdgeInsets.only(left: 1),
                    decoration: new BoxDecoration(
                        border: Border.all(color: grayColor),
                        borderRadius: BorderRadius.circular(30),
                        color: grayColor)),
              )
            ],
          ),


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

  Widget radiusContainer(BuildContext context,String givenText, double givenPadding,String family ,type , controller) {
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

                TextFormField(controller: controller,keyboardType: type,
                  textDirection: TextDirection.ltr,textAlign: TextAlign.end,showCursor: false,
                  decoration: new InputDecoration(focusColor: redColor,icon: IconButton( icon: Icon(Icons.edit,color:grayColor
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
//=====================================================================================================

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
