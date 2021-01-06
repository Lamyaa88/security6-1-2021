/*  JoinUs
  scaffold containing a build body and the upper part
the function called build body is including all 8 text fields
the function which  called radiusContainer is used to build every  single text field
and one of it's parameters is controller which is used in backend .

 */

//======================================================================= libraries
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:security/screens/home.dart';
import 'package:security/screens/notifications.dart';
import 'package:security/test/test6.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../animated_navigation.dart';
import 'package:flutter_share/flutter_share.dart';


//==========================================================================================social media sharing
Future<void> share() async {
  await FlutterShare.share(
      title: 'Example share',
      text: 'طورت شركة  الزواهد خبرات مميزة في المجالات الأمنية المتنوعة عبر الاشتغال في خدمات أمنية كبيرة وقد قامت شركة الزواهد '
          'ومازالت تقوم بخدمة قطاع واسع من العملاء في كل من القطاع العام والخاص مثل السفارات  و القنصليات والمطارات'
          ' والمجمعات السكنية والبنوك والمستشفيات والفنادق والمدارس. وشركة الزواهدحريصة على توظيف مواطنين سعوديين لديهم خبرات كافية في '
          'المجالين العسكري والأمني ، كما أنها تعطي اهتمام كبير لبرامج التدريب والتأهيل لمساعدة موظفيها في تنفيذ المهام '
          'الأمنية المطلوبة. \r\n \r\nوتقوم شركة الزواهد للحراسات الامنية بتزويد عملائها بأحدث المعدات الأمنية عند طلبهم ، '
          'وتشتمل على اجهزة انذار الحريق واجهزة التحكم بالدخول ، وكاميرات المراقبة التلفزيونية،والمراقبةعن بعد '
          'باستخدام الخطوط الهاتفية التي تم ربطها بغرفة المراقبة والتحكم بالشركة ، وذلك لمراقبة'
          ' المباني والقصور والفيلات وغيرها خلال غياب ساكنيها أثناء اجازاتهم ، وبالا ',
      linkUrl: 'https://www.facebook.com/alzawahied/',
      chooserTitle: 'شركة حراسات أمنية ');
}

//========================================================================================== api function
Future<UserModel> getNews(String id) async {
  final String apiUrl = "http://n5ba.com/gaurds/the_json/shownews";
  final response = await http.post(apiUrl, body: {
    "id": id,
  });

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(response.body);

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class News extends StatefulWidget {
  News(this.NewsId1, {Key key}) : super(key: key);

  //========================================================================= the id of every single  image

  final String NewsId1;

  @override
  _NewsState createState() {
    return _NewsState(NewsId1);
  }
}

class _NewsState extends State<News> {
//  ========================================================= user id
  String  userIdWillBeSentToNotificationsPage ;
  Future getId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userIdWillBeSentToNotificationsPage = preferences.getString('id');
    });
  }

//  ===========================================================
  final String NewsId2;
  UserModel _user;
  _NewsState(this.NewsId2);
  @override
  void initState() {
    getNews(NewsId2);
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
            height: height * .3,
            child: Stack(
              children: <Widget>[
                Container(
                    child: InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FutureBuilder<UserModel>(
                        future: getNews(NewsId2),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            String imagePath = snapshot.data.data[0]["image"];
                            String baseUrl = "http://gaurds.n5ba.com/";

                            return Container(
                              height: height * .3,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://gaurds.n5ba.com/$imagePath'),
                                      fit: BoxFit.cover)),
                            );
                            //=====================================================================================================

                          } else if (snapshot.hasError) {
                            return  Container(
                              height: height * .3,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/logo.png"),
                                      fit: BoxFit.fitHeight)),
                            );
                          }
                          return Center(
                              child: Container());
                        },
                      ),
                    ],
                  ),
                )),
                Container(
                  color: redColor.withOpacity(.5),
                  height: height * .3,
                  width: width,
                ),
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    heightSizedBox(context, .06),
                    Row(
                      children: <Widget>[
                        widthSizedBox(context, .03),
                        InkWell(
                          child: iconContainer(
                              Icons.notifications, whiteColor, 18),
                          onTap: () {
                            Navigator.push(context,
                                SlideFromTopRoute(widget: Notifications6(userIdWillBeSentToNotificationsPage)));
                          },
                        ),
                        widthSizedBox(context, .81),
                        InkWell(
                          child: iconContainer(
                              Icons.arrow_forward, whiteColor, 18),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) => Home()));
                          },
                        ),
                        widthSizedBox(context, .03),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    heightSizedBox(context, .04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: width * .1,
                        ),
                        Container(
                          child: Expanded(
                            child: FutureBuilder<UserModel>(
                              future: getNews(NewsId2),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      //===================================================================================================== title
                                      Text(
                                        snapshot.data.data[0]["title"],
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'ArbFONTS-59GE-SS-Two',
                                          color: whiteColor,
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                    "${''}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'ArbFONTS-59GE-SS-Two',
                                        color: grayColor),
                                  );
                                }
                                return Center(
                                    child: Container());
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .1,
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Card(
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
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FutureBuilder<UserModel>(
                    future: getNews(NewsId2),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //===================================================================================================== date
                            Text(
                              snapshot.data.data[0]['date'],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 13,
                                color: grayColor,
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return  Container(
                        );
                      }
                      return Center(
                          child: Container());
                    },
                  ),
                  SizedBox(
                    height: height * .03,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: height * .01),
          FutureBuilder<UserModel>(
            future: getNews(NewsId2),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //===================================================================================================== content
                    Text(
                      snapshot.data.data[0]['content'],
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'ArbFONTS-59GE-SS-Two',
                        color: grayColor,
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(child: Center(child:  Center(
                      child: SpinKitFoldingCube( color: redColor,size: height*.1,),
                    ),
                    )
                      ,),
                    heightSizedBox(context, .3)
                  ],
                );
              }
              return Center(
                child: Container(
                  child: Container(child: Center(child:  Center(
                    child: SpinKitFadingCircle( color: redColor,size: height*.1,),
                  ),
                  )
                    ,) ,
                )
              );
            },
          ),
          SizedBox(
            height: height * .1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              FlatButton(
                child:Icon(Icons.share,color: redColor,),
                onPressed: share,
              ),
              Text(
                'مشاركة الخبر',
                style: TextStyle(
                    fontSize: 15,
                    color: redColor,
                    letterSpacing: 1,
                    fontFamily: 'ArbFONTS-59GE-SS-Two',
                    fontWeight: FontWeight.bold),
              ),

            ],
          ),
          SizedBox(
            height: height * .04,
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              widthSizedBox(context, .02),
//              //===================================================================================================== social media
//
//              myCircularAvatar(18, 'assets/facebook2.png', () {}),
//              widthSizedBox(context, .02),
//
//              myCircularAvatar(18, 'assets/twitter2.png', () {}),
//              widthSizedBox(context, .02),
//
//              myCircularAvatar(18, 'assets/google2.png', () {}),
//            ],
//          ),
        ],
      ),
    );
  }

//===================================================================================================== circular avatar
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

  //=====================================================================================================  sized box
  heightSizedBox(BuildContext context, double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * givenPercentage,
    );
  }

//==================================================================================================================defaultWidthSizedBox
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
}

//=====================================================================================================  model
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

dynamic userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String message;
  String result;
  dynamic data;

//  String title;
//  String image;
//  String content;
//  String date;

  UserModel({this.id, this.message, this.result, this.data
//    this.title,
//    this.image,
//    this.content,
//    this.date
      });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json["id"],
        message: json["message"],
        result: json["result"],
        data: json["data"],

//    image: json["image"],
//   content: json['content'],
//    date: json['date']
      );

  Map<String, String> toJson() => {
        "id": id,
        "message": message,
        "result": result,
        "data": data
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
//=====================================================================================================
