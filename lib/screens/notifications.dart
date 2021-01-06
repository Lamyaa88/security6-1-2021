import 'package:flutter/material.dart';
import 'package:security/costants/constantColors.dart';
import 'package:security/screens/home.dart';
//=====================================================================================================

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                        widthSizedBox(context, .4),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
              _buildRow(context),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'منذ 10 دقائق ',
                    style: TextStyle(
                      color: grayColor,
                      fontSize: 10,
                      fontFamily: 'ArbFONTS-59GE-SS-Two',
                    ),
                  ),
                  widthSizedBox(context, .01),
                  iconContainer(Icons.timer, grayColor, 15),
                ],
              ),
              heightSizedBox(context, .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  widthSizedBox(context, .02),
                  heightSizedBox(context, .03)
                ],
              ),
            ],
          ),
          widthSizedBox(context, .17),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              heightSizedBox(context, .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  widthSizedBox(context, .14),
                  myText('يوسف الملهوف', blackColor, 13),
                ],
              ),
              heightSizedBox(context, .01),
              Text(
                'طلب تسعيرة من فضلكم شكرا',
                style: TextStyle(
                  color: grayColor,
                  fontSize: 10,
                  fontFamily: 'ArbFONTS-59GE-SS-Two',
                ),
              ),
              heightSizedBox(context, .03),
            ],
          ),
          widthSizedBox(context, .02),
          Container(
              height: height * .1,
              width: width * .02,
              decoration: new BoxDecoration(
                  border: Border.all(color: redColor),
                  borderRadius: BorderRadius.circular(30),
                  color: redColor)),
          widthSizedBox(context, .02)
        ],
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

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
