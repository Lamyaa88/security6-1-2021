import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:security/models/aboutUsModel.dart';
import 'package:security/animated_navigation.dart';
import 'package:security/test/test6.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'notifications.dart';

//=====================================================================================================
class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String  userIdWillBeSentToNotificationsPage ;
  Future getId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userIdWillBeSentToNotificationsPage = preferences.getString('id');
    });
  }

  Future<AbutUsModel> futureAboutUs;
  @override
  void initState() {
    super.initState();
    futureAboutUs = fetchAlbum();
  }
//===================================================================================================== api function
  Future<AbutUsModel> fetchAlbum() async {
    final response =
        await http.get('https://www.n5ba.com/gaurds/The_json/aboutus');

    // Appropriate action depending upon the
    // server response
    if (response.statusCode == 200) {
      return AbutUsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
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
                        InkWell(
                          child: iconContainer(
                              Icons.notifications, whiteColor, 20),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) => Notifications6(userIdWillBeSentToNotificationsPage)));
                          },
                        ),
                        widthSizedBox(context, .25),
                        Text(
                          'عن الشركة',
                          style: TextStyle(
                              fontSize: 20,
                              color: whiteColor,
                              letterSpacing: 1,
                              fontFamily: 'ArbFONTS-59GE-SS-Two',
                              fontWeight: FontWeight.bold),
                        ),
                        widthSizedBox(context, .25),
                        InkWell(
                          child: iconContainer(
                              Icons.arrow_forward, whiteColor, 20),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) => Home()));
                          },
                        ),
                        widthSizedBox(context, .03),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
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
              Container(
                padding: EdgeInsets.only(top: height * .0, left: 0),
                height: height * .18,
                width: width * .7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                    image: DecorationImage(
                        image: AssetImage('assets/information2.png'),
                        fit: BoxFit.fitHeight)),
              ),
              heightSizedBox(context, .05),
              //===================================================================================================== social media
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  myCircularAvatar(35, 'assets/img1.png', () {}),
                  widthSizedBox(context, .04),
                  myCircularAvatar(35, 'assets/img3.png', () {}),
                  widthSizedBox(context, .04),
                  myCircularAvatar(35, 'assets/img2.png', () {}),
                  widthSizedBox(context, .04),
                  myCircularAvatar(35, 'assets/img4.png', () {}),
                ],
              ),
              SizedBox(height: height * .05),
              FutureBuilder<AbutUsModel>(
                future: futureAboutUs,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapshot.data.data[0]['description'],
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
                    return Text(
                      "${'لا يوجد اتصال بالإنترنت'}",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'ArbFONTS-59GE-SS-Two',
                          color: grayColor),
                    );
                  }
                  return Center(child: SpinKitFadingCircle( color: redColor,size: height*.1,));
                },
              ),
              heightSizedBox(context, .03),
            ],
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

//==================================================================================================================defaultWidthSizedBox
  widthSizedBox(BuildContext context, double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(width: width * givenPercentage);
  }
//=====================================================================================================
  iconContainer(givenIcon, givenColor, double givenSize) {
    return Icon(
      givenIcon,
      color: givenColor,
      size: givenSize,
    );
  }
//=====================================================================================================
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
//===================================================================================================== circular avatar
  myCircularAvatar(double givenRadius, String givenPath, onTap) {
    return Container(
        padding: EdgeInsets.only(left: 0),
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
//=====================================================================================================
const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
//=====================================================================================================
_launchURL() async {
  const url2 = 'https://www.facebook.com/alzawahied/';
  if (await canLaunch(url2)) {
    await launch(url2);
  } else {
    throw 'Could not launch $url2';
  }
}
//==================================
