import 'package:flutter/material.dart';
import 'package:security/screens/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:security/animated_navigation.dart';
import 'package:security/test/test6.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notifications.dart';
import 'package:firebase_core/firebase_core.dart';





class Messaging extends StatefulWidget {

  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  String  userIdWillBeSentToNotificationsPage ;
  Future getId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userIdWillBeSentToNotificationsPage = preferences.getString('id');
    });
  }
   final fire =  Firebase.initializeApp();

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

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
                                      widget: Notifications6(userIdWillBeSentToNotificationsPage)
                                  )
                              );
                            },

                            ),
                            widthSizedBox(context, .25),


                            Text('راسلنا الآن',style
                                :TextStyle(fontSize:20,color: whiteColor
                                ,letterSpacing: 1,fontFamily: 'ArbFONTS-59GE-SS-Two',fontWeight: FontWeight.bold
                            ),

                            ),
                            widthSizedBox(context, .25),

                            InkWell(
                              child: iconContainer(Icons.arrow_forward, whiteColor, 20),onTap:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>Home()),
                              );},
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
          //=====================================================================================================

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


    return Padding(
      padding: const EdgeInsets.all(8.0),
      //===================================================================================================== all  fields except  notes

      child: ListView(
        children: <Widget>[


          radiusContainer(context, 'الاسم', 10,'ArbFONTS-59GE-SS-Two',null,TextInputType.text),
          heightSizedBox(context, .02

          ),
          radiusContainer(context, 'البريد الإلكتروني', 10,'ArbFONTS-59GE-SS-Two',null ,TextInputType.emailAddress),



          heightSizedBox(context, .02),
          radiusContainer(context, 'رقم الجوال', 10,'ArbFONTS-59GE-SS-Two',null,TextInputType.number),
          heightSizedBox(context, .02
          ),

          radiusContainer(context, 'العنوان', 10,'ArbFONTS-59GE-SS-Two',null ,TextInputType.text),

          heightSizedBox(context, .02),
          //===================================================================================================== notes text field

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(

                    width: width * .82,
                    child: Center(
                      child: Container(
                          child:
                          Center(
                            child: TextFormField
                              (
                              keyboardType: TextInputType.text,
                              textDirection: TextDirection.ltr,textAlign: TextAlign.end,showCursor: false,maxLines: 8,

                              decoration: new InputDecoration(focusColor: redColor,icon: IconButton( icon: Icon(null,color:grayColor
                                ,textDirection: TextDirection.rtl,),onPressed: (){}
                                ,disabledColor: grayColor,focusColor: grayColor,),counterStyle: TextStyle(

                              ),
                                hintText: 'الرسالة',hintStyle: TextStyle(
                                  fontSize: 12,fontFamily: 'ArbFONTS-59GE-SS-Two',
                                ), enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:
                                  Colors.white.withOpacity(.0001)),
                                ),

                                labelStyle: new TextStyle(color: whiteColor),
                                border: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Colors.white,
                                  ),
                                ),focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade900.withOpacity(.0001)),
                                ),
                              ),

                            ),
                          ) ,

                      ),
                    ),

                    padding: EdgeInsets.only(right: 12,),
                    decoration: new BoxDecoration(
                        border: Border.all(color:secondaryWhiteColor),
                        borderRadius: BorderRadius.circular(30),
                        color: secondaryWhiteColor)),
              ],
            ),
          ),
          heightSizedBox(context, .02),




          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: width * .7,
                  child: Center(
                    child: InkWell(
                        onTap: null,
                        child: myText('إرسال الآن', whiteColor, 15)
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

  Widget radiusContainer(BuildContext context,String givenText, double givenPadding,String family,lable,type ) {
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

                TextFormField(keyboardType: type ,
                  textDirection: TextDirection.ltr,textAlign: TextAlign.end,showCursor: false,
                  decoration: new InputDecoration(focusColor: redColor,icon: IconButton( icon: Icon(lable,color
                      :grayColor,textDirection: TextDirection.rtl,),onPressed: (){}
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
//=====================================================================================================


const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
