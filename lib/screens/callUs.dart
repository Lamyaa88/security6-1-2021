import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:security/screens/googleMap.dart';
import 'package:security/screens/home.dart';
import 'package:security/screens/messaging.dart';
import 'package:security/screens/sendingEmailPage.dart';
import 'package:security/test/test6.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../animated_navigation.dart';
import 'notifications.dart';

//===================================================================================================== location
  _launchMapsUrl() async {
  const url = 'https://hrasat.com/%d8%a7%d8%aa%d8%b5%d9%84-%d8%a8%d9%86%d8%a7/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
//===================================================================================================== call

_launchCaller() async {
  const url = "tel:+966 59 439 0000";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
//===================================================================================================== email

final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'smith@example.com',
    queryParameters: {
      'subject': 'Example Subject & Symbols are allowed!'
    }
);
//===================================================================================================== facebook


_launchURLfacebook() async {
  const url = 'https://www.facebook.com/alzawahied';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
//=====================================================================================================  twitter

_launchURLTwitter() async {
  const url = 'https://twitter.com/alzawahied';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
//===================================================================================================== google +

_launchURLGoogle() async {
  const url = 'https://hrasat.com/';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

//=====================================================================================================   class call us

class CallUs extends StatefulWidget {
  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
  String  userIdWillBeSentToNotificationsPage ;
  Future getId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userIdWillBeSentToNotificationsPage = preferences.getString('id');
    });
  }
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(24.744591151739403, 46.70424630059864);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
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
                              Icons.notifications, whiteColor, height * .03),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifications6(userIdWillBeSentToNotificationsPage)),
                            );
                          },
                        ),
                        widthSizedBox(context, .25),
                        Text(
                          'اتصل بنا',
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
                              Icons.arrow_forward, whiteColor, height * .03),
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
            padding: EdgeInsets.only(top: height * .14),
            child: Card(
              child: _buildBody(context),
              margin: EdgeInsets.fromLTRB(6.5, height * .02, 6.5, 0),
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

    return Container(
      color: secondaryWhiteColor,
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                  child: Container(
                    height: height * .30,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
//                      image: DecorationImage(
//                          //===================================================================================================== map
//
//                          image: AssetImage('assets/map.png'),
//                          fit: BoxFit.cover),
                    ),
                    child:GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    ),
                  ),
                  onTap:() {
                    Navigator.push(
                        context, SlideFromLeftPageRoute(widget:MyMap()));
                  },),
              heightSizedBox(context, .0),
              Card(
                elevation: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '+966 59 439 0000',
                          style: TextStyle(
                              fontSize: height * .02,
                              color: grayColor,
                              fontWeight: FontWeight.bold),
                        ),
                        widthSizedBox(context, .0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[widthSizedBox(context, 0),
                            RaisedButton(
                              elevation: 0,
                              color: whiteColor,
                              onPressed: _launchCaller,
                              child:Icon(Icons.call ,color: redColor,size: height*.04,),
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSizedBox(context, .02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'info@hrasat.com',
                          style: TextStyle(
                              fontSize: height * .02,
                              color: grayColor,
                              fontWeight: FontWeight.bold),
                        ),
                        widthSizedBox(context, .03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[widthSizedBox(context, 0),
                            RaisedButton(
                              elevation: 0,
                              color: whiteColor,
                              onPressed:() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeEmail()),
                                );
                              },
                              child:Icon(Icons.email ,color: redColor,size: height*.04,),
                              textColor: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSizedBox(context, .01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          ' الشيخ حسين بن حسن، الواحة، الرياض',
                          style: TextStyle(
                              fontSize: height * .02,
                              color: grayColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ArbFONTS-59GE-SS-Two'),
                        ),
                        widthSizedBox(context, .07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[widthSizedBox(context, 0),
                      RaisedButton(
                        elevation: 0,
                        color: whiteColor,
                        onPressed: _launchMapsUrl,
                        child:Icon(Icons.location_on ,color: redColor,size: height*.04,),
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                elevation: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    heightSizedBox(context, .02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'تابعنا على',
                          style: TextStyle(
                              fontSize: height * .02,
                              color: redColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ArbFONTS-59GE-SS-Two'),
                        ),
                        widthSizedBox(context, .03),
                      ],
                    ),

                    heightSizedBox(context, .02),
                    //=====================================================================================================( facebook + google + twitter )
                    Padding(
                      padding:  EdgeInsets.only(left: width*.2,right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[


                              RaisedButton(
                                shape: CircleBorder(

                                    side: BorderSide(color:whiteColor)
                                ),

                                elevation: 0,
                                splashColor: whiteColor,

                                color: whiteColor,
                                onPressed: _launchURLfacebook,
                                child: CircleAvatar(
                                  backgroundColor: whiteColor,
                                  radius: height*.03,
                                  backgroundImage:AssetImage("assets/facebook2.png") ,
                                ),
                              ),


                          RaisedButton(

                            shape: CircleBorder(

                                side: BorderSide(color:whiteColor)
                            ),
                            elevation: 0,
                            color: whiteColor,
                            splashColor: whiteColor,

                            onPressed: _launchURLTwitter,
                            child:CircleAvatar(
                              backgroundColor: whiteColor,
                              backgroundImage:AssetImage("assets/twitter2.png"),
                                radius: height*.03
                            ),
                          ),


                          RaisedButton(
                            shape: CircleBorder(

                                side: BorderSide(color:whiteColor)
                            ),
                            elevation: 0,
                            splashColor: whiteColor,
                            color: whiteColor,
                            onPressed: _launchURLGoogle,
                            child: Container(
                              child: CircleAvatar(
                                backgroundColor: whiteColor,
                                  radius: height*.03,
                                backgroundImage: AssetImage("assets/google2.png"),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              heightSizedBox(context, .02),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell( onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Messaging()),
                      );
                    },
                      child: Container(
                          width: width * .7,
                          child: Center(
                            child: InkWell(

                                child: myText(
                                    'إرسال الآن', whiteColor, height * .025)),
                          ),
                          height: height * .075,
                          padding: EdgeInsets.only(left: height*.001),
                          decoration: new BoxDecoration(
                              border: Border.all(color: redColor),
                              borderRadius: BorderRadius.circular(height * .07),
                              color: redColor)),
                    )
                  ],
                ),
              ),
            ],
          ),
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

  Widget radiusContainer(BuildContext context, String givenText,
      double givenPadding, String family, lable) {
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
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.end,
                  decoration: new InputDecoration(
                    focusColor: redColor,
                    icon: IconButton(
                      icon: Icon(
                        lable,
                        color: grayColor,
                        textDirection: TextDirection.rtl,
                      ),
                      onPressed: () {},
                      disabledColor: grayColor,
                      focusColor: grayColor,
                    ),
                    counterStyle: TextStyle(),
                    hintText: givenText,
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: family,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(.0001)),
                    ),
                    labelStyle: new TextStyle(color: grayColor),
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.white,
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
                border: Border.all(color: secondaryWhiteColor),
                borderRadius: BorderRadius.circular(30),
                color: secondaryWhiteColor)),
      ],
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

}

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;

//=====================================================================================================  launch url facebook
_launchURL() async {
  const url2 = 'https://www.facebook.com/alzawahied/';
  if (await canLaunch(url2)) {
    await launch(url2);
  } else {
    throw 'Could not launch $url2';
  }
}
