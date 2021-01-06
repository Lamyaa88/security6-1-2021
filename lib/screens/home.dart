import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:security/screens/aboutUs.dart';
import 'package:security/screens/callUs.dart';
import 'package:security/screens/joinUs.dart';
import 'package:security/screens/myAccount.dart';
import 'package:security/screens/myOrders.dart';
import 'package:security/test/test6.dart';
import 'myOrdersWhenNotLogedIn.dart';
import 'dart:convert';
import 'package:security/screens/news.dart';
import 'package:security/screens/pricing.dart';
import 'package:security/screens/services.dart';
import '../animated_navigation.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String  userIdWillBeSentToNotificationsPage ;
  Future getId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userIdWillBeSentToNotificationsPage = preferences.getString('id');
    });
  }



  String baseURL = 'http://gaurds.n5ba.com/';
  String stringResponse;
  List listResponse;
  Map mapResponse;
  List listOfFacts;
  //=================================================================================================================================== the saved id

  String savedId = "replaced with stored  user id _ if no id => there is no stored id   ";
  String savedEmail = "";
  String savedPassword = "replaced with stored user password  _ if no password  => there is no stored password  ";
  String savedName = "replaced with stored user name  _ if no password  => there is no stored name  ";
  String savedPhone = "replaced with stored user phone   _ if no password  => there is no stored phone   ";





  Future fechData() async {
    //=================================================================================================================================== api function
    http.Response response;

    response = await http.get('http://gaurds.n5ba.com/The_json/news');
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listOfFacts = mapResponse['data'];
      });
    }
  }

//=================================================================================================================================== loading the page
  @override
  void initState() {
    getId();
    fechData();
    super.initState();
    setState(() {
      savedId = StorageUtil.getStringId("key_id");
    });
    setState(() {
      savedEmail = StorageUtil.getStringEmail("key_email");
    });
    setState(() {
      savedPassword = StorageUtil.getStringPassword("key_password");
    });
    setState(() {
      savedName = StorageUtil.getStringName("key_name");

    }); setState(() {
      savedPhone = StorageUtil.getStringPhone("key_phone");
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: whiteColor,
        body: ListView(
          children: <Widget>[
            Container(
              height: height * .18,
              width: width,
              color: redColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                          context, SlideFromLeftPageRoute(widget: Notifications6(userIdWillBeSentToNotificationsPage)));
                    },
                    color: whiteColor,
                  ),
                  SizedBox(
                    width: width * .22,
                  ),
                  Container(
                      height: height * .09,
                      width: width * .2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.fitHeight),
                      )),
                  SizedBox(
                    width: width * .22,
                  ),
                  IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation5) {
                            return CallUs();
                          },
                          transitionsBuilder: (context, animation5, animation2, child) {
                            return FadeTransition(
                              opacity: animation5,
                              child: child,
                            );
                          },
                          transitionDuration: Duration(milliseconds: 1),
                        ),
                      );
                    },
                    color: whiteColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            newsSlider(context),
            SizedBox(
              height: height * .01,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    iconBox(context, 'assets/user.png', () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) => MyAccount()));
                    }, 'حسابي'),
                    SizedBox(
                      width: width * .01,
                    ),
                    iconBox(context, 'assets/information.png', () {
                      Navigator.push(
                          context, SlideFromRightPageRoute(widget: AboutUs()));
                    }, 'عن الشركة'),
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    iconBox(context, 'assets/team.png', () {
                      Navigator.push(
                          context, SlideFromLeftPageRoute(widget: JoinUs()));
                    }, 'انضم إلينا'),
                    SizedBox(
                      width: width * .01,
                    ),
                    iconBox(context, 'assets/money.png', () {
                      Navigator.push(
                          context, SlideFromRightPageRoute(widget: Pricing(userIdWillBeSentToNotificationsPage)));
                    }, 'طلب التسعير'),
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    iconBox(context, 'assets/team-1.png', () {
                      Navigator.push(context,
//                          ================ هنا بيتبعت ال id للمستخدم وتتعرض الطلبات الخاصة بيه  ==============================================
                          SlideFromLeftPageRoute(widget: MyOrders(userIdWillBeSentToNotificationsPage)));
                    }, 'طلباتي'),
                    SizedBox(
                      width: width * .01,
                    ),
                    iconBox(context, 'assets/select.png', () {
                      Navigator.push(
                          context, SlideFromRightPageRoute(widget: Services()));
                    }, 'الخدمات'),
                  ],
                ),
              ],
            ),
            //=============================================this part is just  for debugging  ================ on press => get the stored id
//            RaisedButton(
//              onPressed: () {
//                setState(() {
//                  savedId = StorageUtil.getStringEmail("key_name");
//                });
//              },
//              textColor: Colors.white,
//              color: Colors.green,
//              padding: EdgeInsets.all(8.0),
//              child: Text(
//                "Get the stored (id)",
//              ),
//            ),
//            Text("--------------------"),
//
//            Text( " your id is :  ${savedId}"),
//
//            Text("--------------------"),
//
//            Text( " your   email  is  : ${savedEmail}"),
//            Text("--------------------"),
//
//            Text( " your  password is :${savedPassword}"),
//            Text("--------------------"),
//            Text( " your  name  is :${savedName}"),
//            Text("--------------------"),
//            Text( " your  phone number  is :${savedPhone}"),
//            Text("--------------------"),



          ],
        ));
  }

//===================================================================================================================================  icon
  iconBox(BuildContext context, String image, navigation, String text) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        InkWell(
          child: Container(
              height: height * .16,
              width: width * .45,
              decoration: new BoxDecoration(
                  border: Border.all(color: grayColor.shade300),
                  borderRadius: BorderRadius.circular(height * .006),
                  color: whiteColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * .01),
                    height: height * .05,
                    width: width * .12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.fitHeight),
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: height * .02,
                      color: blackColor,
                      letterSpacing: 1,
                      fontFamily: 'ArbFONTS-59GE-SS-Two',
                    ),
                  ),
                ],
              )),
          onTap: navigation,
        ),
      ],
    );
  }

//=================================================================================================================================== news slider
  Widget newsSlider(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Container(
        height: height * .20,
        width: width * .1,
        child: mapResponse == null
            ? Column(
              children: <Widget>[
                SizedBox(height: height*.05,),

                Container(child: Container(child: Center(child:  Center(
          child: SpinKitFadingCube( color: redColor,size: height*.06,),
                  
    ),
    )
    ,) ,),
                SizedBox(height: height*.05,),
                Text("في انتظار الحصول على البيانات " ,style: TextStyle(
                  fontSize: height * .015,
                  fontFamily: 'ArbFONTS-59GE-SS-Two',
                  color: redColor,
                ),)
              ],
            )
            : ListView.builder(
                itemBuilder: (context, index) {
                  //======================================================================================== absolute  image path
                  String imagePath = listOfFacts[index]['image'];

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      titleCard(
                          context,
                          //========================================================== base url + image path
                          'http://gaurds.n5ba.com/$imagePath',
                          listOfFacts[index]['title'],
                          //=========================================== the id of every single  image (will be sent )

                          listOfFacts[index]["id"])
                    ],
                  );
                },
                itemCount: listOfFacts == null ? 0 : listOfFacts.length,
                scrollDirection: Axis.horizontal,
              ));

//
  }

//===================================================================================================================================
  Widget titleCard(
      //============================================================================================= id is one of the parameters here
      BuildContext context,
      String image,
      String text,
      String SendId) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return InkWell(
        child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: height * .22,
                  width: width * .7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * .01),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: blackColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(height * .01),
                  ),
                  height: height * .22,
                  width: width * .7,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * .01),
                  ),
                  height: height * .22,
                  width: width * .7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(text,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: height * .02,
                              fontFamily: 'ArbFONTS-59GE-SS-Two',
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            )),
                        padding: EdgeInsets.only(right: height * .01),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        child: Text('',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: height * .02,
                              fontFamily: 'ArbFONTS-59GE-SS-Two',
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            )),
                        padding: EdgeInsets.only(right: height * .01),
                      )
                    ],
                  ),
                )
              ],
            )),
        onTap: () {
          Navigator.push(
            context,
            //=============================================================================================================== navigate and send news id
            MaterialPageRoute(builder: (context) => News(SendId)),
          );
        }
        );

  }
//  navigateToOrders()async{
//    await savedEmail;
//     if(savedEmail.isEmpty){
//       Navigator.push(
//         context,
//         //=============================================================================================================== navigate and send news id
//         MaterialPageRoute(builder: (context) => MyOrdersWhenNotLogedIn()),
//       );
//
//    }else if(savedEmail.isNotEmpty){
//       Navigator.push(
//         context,
//         //=============================================================================================================== navigate and send news id
//         MaterialPageRoute(builder: (context) => MyOrdersWhenNotLogedIn()),
//       );
//
//
//     }
//  }
}

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
