import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import 'package:security/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//final String notificationMressage = ".............";
// Map mapResponse;
//Future<UserModel> createUser(String user_id,
//    ) async {
//  final String apiUrl = "http://n5ba.com/gaurds/the_json/all_notifications";
//  final response = await http.post(apiUrl, body: {
//    //=========================================================================================== required parameter
//    "user_id": user_id,
//
//    //===========================================================================================
//  });
//
//  if (response.statusCode == 200) {
//    final String responseString = response.body;
//    print(response.body);
//
//    mapResponse = json.decode(response.body);
//
//
//
//    return userModelFromJson(responseString);
//  } else {
//    return null;
//  }
//}

//=====================================================================================================

class Notifications6 extends StatefulWidget {

  Notifications6(this.userIdToGetNotification, {Key key}) : super(key: key);
  final String userIdToGetNotification;

  @override

  _Notifications6State createState() => _Notifications6State(userIdToGetNotification);


}

class _Notifications6State extends State<Notifications6> {
  Map mapResponse;
  List notificationDetails ;
  Future<UserModel> getAllNotifications(String user_id,
      ) async {
    final String apiUrl = "http://n5ba.com/gaurds/the_json/all_notifications";
    final response = await http.post(apiUrl, body: {
      //=========================================================================================== required parameter
      "user_id": user_id,

      //===========================================================================================
    });

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(response.body);
      setState(() {
        mapResponse = json.decode(response.body);
        print(mapResponse);

      });
      setState(() {
        notificationDetails = mapResponse["data"];
      });





      return userModelFromJson(responseString);
    } else {
      return null;
    }
  }
//  Future<UserModel> getOneNotificationByNotificationId(String user_id,
//      ) async {
//    final String apiUrl = "https://www.n5ba.com/gaurds/the_json/notification";
//    final response = await http.post(apiUrl, body: {
//      //=========================================================================================== required parameter
//      "notification_id": user_id,
//
//      //===========================================================================================
//    });
//
//    if (response.statusCode == 200) {
//      final String responseString = response.body;
//      print(response.body);
//      setState(() {
//        mapResponse = json.decode(response.body);
//        notificationDetails = mapResponse["data"] ;
//        print (notificationDetails);
//        print(mapResponse);
//
//      });
//
//
//
//
//
//      return userModelFromJson(responseString);
//    } else {
//      return null;
//    }
//  }

  final String userIdToGetNotificationState ;
  _Notifications6State(this.userIdToGetNotificationState );


//  String userId = "";
//  Future getId()async{
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    setState(() {
//      userId = preferences.getString('id');
//    });
//  }


   Future replace()async{
    final String user_id = userIdToGetNotificationState;

    final UserModel user = await getAllNotifications(
       "44" );
    setState(() {
      _user = user;
    });
  }


//=====================================================================================================
  String title = "";
  String helper = "helper";
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//  ==========================================================================================

  @override
  UserModel _user;
  void initState() {
    // TODO: implement initState
    super.initState();
    print(userIdToGetNotificationState);


//    getId();
//    print(userId);
   getAllNotifications("44");
//     getOneNotificationByNotificationId("1");
   replace();

//    _firebaseMessaging.configure(
//      onMessage: (message) async{
//        setState(() {
//          title = message["notification"]["title"];
//          helper = message["notification"]["body"];
//        });
//
//      },
//      onResume: (message) async{
//        setState(() {
//          title = message["title"];
//          helper = message["body"];
//        });
//
//      },
//
//    );
//    FirebaseMessaging().configure(
//      onMessage: (Map<String, dynamic> message) async {
//        // HANDLE IT HERE
//        print("onMessage: $message");
////        Get.showSnackbar(GetBar(
////          title: message['title'],
////          message: message['body'],
////        ));
//      },
//      onBackgroundMessage: myBackgroundMessageHandler,
//      onLaunch: (Map<String, dynamic> message) async {
//        print("onLaunch: $message");
//      },
//      onResume: (Map<String, dynamic> message) async {
//        print("onResume: $message");
//      },
//    );
  }
  @override

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
//=====================================================================================================

    return Scaffold(
      backgroundColor: secondaryWhiteColor,
      body: Stack(
        children: <Widget>[
          Container(
            color: redColor,
            height: height * .22,
            child: Stack(
              children: <Widget>[
                Container(
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[],
                      ),
                    )),
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        heightSizedBox(context, .08),
                        Row(
                          children: <Widget>[
                            Text(
                              'الإشعارات',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: whiteColor,
                                  letterSpacing: 1,
                                  fontFamily: 'ArbFONTS-59GE-SS-Two',
                                  fontWeight: FontWeight.bold),
                            ),
                            widthSizedBox(context, .35


                            ),
                            InkWell(
                              child: iconContainer(
                                  Icons.arrow_forward, whiteColor, 20),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Home()),
                                );
                              },
                            ),
                            widthSizedBox(context, .03),
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                        heightSizedBox(context, .04),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Card(
              //===================================================================================================== build body

              child: _buildBody(context),
              margin: EdgeInsets.fromLTRB(6.5, 20, 6.5, 0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        //=====================================================================================================  list of notifications

        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildRow(context),

              ],
            ),
          )
        ],
      ),
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

  iconContainer(givenIcon, givenColor, double givenSize) {
    return Icon(
      givenIcon,
      color: givenColor,
      size: givenSize,
    );
  }

  Widget _buildRow(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 1,
      child: Center(
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    child:mapResponse==null?Column(
                    children: <Widget>[
            SizedBox(height: height*.05,),

            Container(child: Container(child: Center(child:  Center(
              child: SpinKitFadingCube( color: redColor,size: height*.03,),

            ),
            )
              ,) ,),
            SizedBox(height: height*.05,),
            ],
                    ):

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                      Container(child: Row(  mainAxisAlignment: MainAxisAlignment.end,


                        children: [
                          Container(width: width*.3,
                            child: Row(
                            children: [

                              Container(
                                child: Icon(Icons.timer,size:width*.03 ,),),
                              widthSizedBox(context, 0.02),
                              Container(
                                child: myText(notificationDetails[0]["created_date"], grayColor, width*.03),
                              ),
                            ],
                          ),
                          ),
                          Container(margin: EdgeInsets.only(left:0),
                            width:width*.5,
                            child: Column(
                              children: [Container(
                                child: myText(notificationDetails[0]["title"], blackColor, width*.03),
                              ),
                                Container(child: myText(notificationDetails[0]["body"], grayColor, width*.025)
                                )

                               ],

                            ),
                          ),SizedBox(width: width*.02,),
                          Container(width: width*.015,height: height*0.1,decoration: new BoxDecoration(
                              border: Border.all(color: redColor),
                              borderRadius: BorderRadius.circular(width*.01),
                              color: redColor)),



                        ],
                      ),

                      )
                    ],)



                  ),
                ),


//              widthSizedBox(context, .04),
//              Container(
//                  height: height * .1,
//                  width: width * .02,
//                  decoration: new BoxDecoration(
//                      border: Border.all(color: redColor),
//                      borderRadius: BorderRadius.circular(30),
//                      color: redColor)),
//              widthSizedBox(context, .02)
              ],
            ),
          ),
        ),
      ),
    );
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
}
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

//=========================================================================================== model
class UserModel {
  String type;
  String name;
  String phone;
  String address;
  String email;
  String notes;
  String message;
  String result;
  String customer_id ;
  //===========================================================================================constructor

  UserModel({
    this.type,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.notes,
    this.message,
    this.result,
    this.customer_id ,
  });
  //===========================================================================================from json

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      type: json["type"],
      name: json["name"],
      phone: json["phone"],
      address: json["address"],
      email: json["email"],
      notes: json["message"],
      message: json["message"],
      result: json["result"],
      customer_id: json["customer_id"]
  );
  //=========================================================================================== to json

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "phone": phone,
    "address": address,
    "email": email,
    "message": notes,
    "message": message,
    "result": result,
    "customer_id" : customer_id,
//    "content":content,
//    "date":date,
  };
}


const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
