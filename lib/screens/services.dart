import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:security/screens/home.dart';
import 'dart:convert';
import 'package:security/screens/notifications.dart';
import 'package:security/test/test6.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../animated_navigation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//===========================================================================================services
class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}
//===========================================================================================  state
class _ServicesState extends State<Services> {
//  ========================================================================= to get id to notifications
  String  userIdWillBeSentToNotificationsPage ;
  Future getId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userIdWillBeSentToNotificationsPage = preferences.getString('id');
    });
  }
//===========================================================================================    variables for api
  String baseURL = 'http://gaurds.n5ba.com/';
  String stringResponse ;
  List listResponse ;
  Map mapResponse ;
  List listOfFacts ;
//=========================================================================================== api function
  Future fechData ()async{
    http.Response response ;
    response = await http.get('http://gaurds.n5ba.com/The_json/services');
    if(response.statusCode ==200){
      setState(() {
        stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listOfFacts = mapResponse['data'];


      });

    }
  }
//===========================================================================================    loading the page
  @override
  void initState() {
    fechData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
//===========================================================================================
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
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) {
                                    return Notifications6(userIdWillBeSentToNotificationsPage);
                                  },
                                  transitionsBuilder: (context, animation1, animation2, child) {
                                    return FadeTransition(
                                      opacity: animation1,
                                      child: child,
                                    );
                                  },
                                  transitionDuration: Duration(milliseconds: 300),
                                ),
                              );
                            },

                            ),
                            widthSizedBox(context, .25),


                            Text('الخدمات',style
                                :TextStyle(fontSize:20,color: whiteColor
                                ,letterSpacing: 1,fontFamily: 'ArbFONTS-59GE-SS-Two',fontWeight: FontWeight.bold
                            ),

                            ),
                            widthSizedBox(context, .25),

                            InkWell(
                              child: iconContainer(Icons.arrow_forward, whiteColor, 20),onTap:() {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (BuildContext context) => Home()));},
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
  //===========================================================================================  build body
  Widget _buildBody(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;


    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(


          child:mapResponse==null?Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

//              Container(child: Center(child:  Center(
//                child:  SpinKitRotatingCircle( color: redColor,size: height*.1,),
//              ),
//              )
//        ,),
              heightSizedBox(context, .03),
//              Container(child: Center(child:  Center(
//                child: SpinKitPouringHourglass( color: redColor,size: height*.1,),
//              ),
//              )
//                ) , heightSizedBox(context, .03),
//              Container(child: Center(child:  Center(
//                child: SpinKitThreeBounce( color: redColor,size: height*.1,),
//              ),
//              )
//                ,), heightSizedBox(context, .03),
//              Container(child: Center(child:  Center(
//                child:  SpinKitCubeGrid( color: redColor,size: height*.1,),
//              ),
//              )
//                ,), heightSizedBox(context, .03),
//              Container(child: Center(child:  Center(
//                child:  SpinKitFoldingCube( color: redColor,size: height*.1,),
//              ),
//              )
//                ,),
//              heightSizedBox(context, .03),
              Container(child: Center(child:  Center(
                child:  SpinKitFadingCircle( color: redColor,size: height*.15,),
              ),
              )
              ,),
            ],
          )
              :ListView.builder(itemBuilder:(context,index){
            String imagePath = listOfFacts[index]['image'];


//===========================================================================================

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                rowContainer(context, listOfFacts[index]['name'], 'http://gaurds.n5ba.com/$imagePath')
              ],
            );


          },itemCount:listOfFacts == null ? 0 : listOfFacts.length ,scrollDirection: Axis.vertical,)
      ),
    );
  }

//=========================================================================================== sized box
  heightSizedBox(BuildContext context,double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * givenPercentage,
    );
  }

//==================================================================================================================defaultWidthSizedBox
  widthSizedBox(BuildContext context,double givenPercentage) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(width: width * givenPercentage);
  }
//===========================================================================================  icon container
  iconContainer(givenIcon, givenColor, double givenSize) {
    return Icon(
      givenIcon,
      color: givenColor,
      size: givenSize,
    );
  }
//=========================================================================================== default text
  myText(String givenText, Color givenColor, double givenSize) {
    return Text(
      givenText,
      style: TextStyle(color: givenColor, fontSize: givenSize,fontFamily: 'ArbFONTS-59GE-SS-Two',fontWeight: FontWeight.bold),
    );
  }
  //===========================================================================================    image of the service
  imageOfServiceContainer( BuildContext context, String path,double Imageheight,double Imagewidth) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return
      InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height *Imageheight,
              width: width * Imagewidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                  ),
                  image: DecorationImage(
                      image: AssetImage(path), fit: BoxFit.fitHeight)),
            )
          ],
        ),

      );

  }
  //===========================================================================================
  serviceContainer( BuildContext context  ,String imagePath,String text,navigation, double customHeight,double customWidth){
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Container(
        width: width*.4,
        height:  height*.2,
        decoration: new BoxDecoration(

            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(0),
            color: whiteColor),


        padding: EdgeInsets.only(top: height*.03),

        child:InkWell(
          child: Container(





            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                  ],
                ),
                imageOfServiceContainer(  context,imagePath,customHeight, customWidth),
                myText(text, blackColor, height*.02),


              ],

            ),
          ),onTap: navigation,
        )

    );
  }
//===========================================================================================  row container (photo + text )
  rowContainer( BuildContext context,String text,String path ){

    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Container( decoration: new BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(5),
        color: whiteColor),
      height:height*.15 ,
      width: width*.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: width*.02),
            width: width*.6,
            child:  Text(text,style
                :TextStyle(fontSize:15,fontFamily:'ArbFONTS-59GE-SS-Two',color: blackColor
              ,letterSpacing: 1,inherit: true,
            ),
              overflow: TextOverflow.clip,
              textDirection: TextDirection.rtl,
            ),
          ),
          widthSizedBox(context, .01),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  child: Container(
                    height: height*.12

                    ,
                    width: width*.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        image: DecorationImage(
                            image: NetworkImage(path), fit: BoxFit.fitHeight)),
                  ) ,onTap: (){}
              )


            ],

          ),        ],
      ),
    ) ;
  }
}
//===========================================================================================   colors
const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;

