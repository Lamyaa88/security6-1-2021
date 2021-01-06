///*  JoinUs
//  scaffold containing a build body and the upper part
//the function called build body is including all 8 text fields
//the function which  called radiusContainer is used to build every  single text field
//and one of it's parameters is controller which is used in backend .
//
// */
//
////======================================================================= libraries
//import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:http/http.dart' as http;
//import 'package:security/screens/home.dart';
////=======================================================
////
//// api function
//List allOrders = [];
//Future<UserModel> createUserforNews(String id ) async{
//  final String apiUrl = "http://n5ba.com/gaurds/the_json/all_prices_application";
//
//  final response = await http.post(apiUrl, body: {
//    "customer_id":id,
//  });
//
//  if(response.statusCode == 200){
//    final String responseString = response.body;
//    print(response.body);
//    print(response.body.length);
//    print(response.body.length);
//
//    ;
//    return userModelFromJson(responseString);
//  }else{
//    return null;
//  }
//}
//
////===========================================================================================  my orders
//class MyOrders extends StatefulWidget {
//  MyOrders(this.NewsId1,{Key key}) : super(key: key);
//  final String NewsId1 ;
//  @override
//  _MyOrdersState createState() {
//    return _MyOrdersState(NewsId1);
//  }
//}
////===========================================================================================  state
//class _MyOrdersState extends State<MyOrders> {
//
//  List allOrders = [];
//  Future<UserModel> createUserforNews222(String id ) async{
//    final String apiUrl = "http://n5ba.com/gaurds/the_json/all_prices_application";
//
//    final response = await http.post(apiUrl, body: {
//      "customer_id":id,
//    });
//
//    if(response.statusCode == 200){
//      final String responseString = response.body;
//      print(response.body);
//      print(response.body.length);
//      print(response.body.length);
//
//      ;
//      return userModelFromJson(responseString);
//    }else{
//      return null;
//    }
//  }
//  final String  NewsId2 ;
//  UserModel _user;
//  _MyOrdersState(this.NewsId2);
//  @override
//  void initState() {
//    createUserforNews(NewsId2);
//    super.initState();
//  }
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//    return Scaffold(
//      backgroundColor: secondaryWhiteColor,
//      body: Stack(
//        children: <Widget>[
//          Container(
//            color: redColor,
//            height:height*.22,
//            child: Stack(
//
//              children: <Widget>[
//                Container(
//                    child: InkWell(
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//
//                        ],
//                      ),
//
//                    )
//
//                ),
//                Container(
//                    child:
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        heightSizedBox(context, .08),
//                        Row(
//
//
//                          children: <Widget>[
//                            Text('طلباتي',style
//                                :TextStyle(fontSize:20,color: whiteColor
//                                ,letterSpacing: 1,fontFamily: 'ArbFONTS-59GE-SS-Two',fontWeight: FontWeight.bold
//                            ),
//
//                            ),
//                            widthSizedBox(context, .36),
//
//                            InkWell(
//                              child: iconContainer(Icons.arrow_forward, whiteColor, 20),onTap: () {
//                              Navigator.of(context).pushReplacement(
//                                  MaterialPageRoute(builder: (BuildContext context) => Home()));},
//                            ),
//                            widthSizedBox(context,.03),
//
//
//                          ],
//                          mainAxisAlignment: MainAxisAlignment.end,
//
//                        ),
//                        heightSizedBox(context, .04),
//
//
//                      ],
//                    )
//
//                )
//
//              ],
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 90),
//            child: Card(
//              child: _buildBody( context),
//              margin: EdgeInsets.fromLTRB(width*.01,20,width*.01,0),
//              elevation:0,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(8)
//              ),
//              clipBehavior: Clip.antiAlias,
//            ),
//          )
//        ],
//      ),
//    );
//  }
////===========================================================================================   build body
//  Widget _buildBody(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//
//
//    return Padding(
//      padding: const EdgeInsets.all(0),
//      child: Padding(
//          padding: const EdgeInsets.all(0),
//          child:ListView(
//
//            children: <Widget>[
//              FutureBuilder<UserModel>(
//                future: createUserforNews(NewsId2),
//                builder: (context, snapshot) {
//                  if (snapshot.hasData) {
////===========================================================================================     listView.builder
//                    return ListView.builder(itemBuilder:(context,index){
//
//                      return Text("rrrrrrrrrrrrr");
//
//
//
////                            return Column(
////                              mainAxisAlignment: MainAxisAlignment.center,
////                              children: <Widget>[
////                                //===========================================================================================         status + date + message + name
////                                _buildRow(context ,snapshot.data.data[index]["date"],snapshot.data.data[index]["Status"]
////                                    ,snapshot.data.data[index]["name"],snapshot.data.data[index]["message"])              ],
////                            );
//
//
//
//
//                    },itemCount: 100
////                            ==========================================
////                          snapshot.data.data.length
////                          =====================================================
//
//                    );
//                  } else if (snapshot.hasError) {
//                    return Text("${'لا يوجد اتصال بالإنترنت'}", style
//                        :TextStyle(fontSize:13,fontFamily:'ArbFONTS-59GE-SS-Two',color: grayColor
//
//                    ),);
//                  }
//                  return  Center(child: Container(child: Container(child: Center(child:  Center(
//                    child: SpinKitFadingCube( color: redColor,size: height*.03,),
//
//                  ),
//                  )
//                    ,) ,), );
//                },
//              ),
//
//
//
//            ],
//
//
//
//
//          )
//
//      ),
//    );
//  }
////===========================================================================================     default sized box
//
//  heightSizedBox(BuildContext context,double givenPercentage) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//    return SizedBox(
//      height: height * givenPercentage,
//    );
//  }
//
////==================================================================================================================defaultWidthSizedBox
//  widthSizedBox(BuildContext context,double givenPercentage) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//    return SizedBox(width: width * givenPercentage);
//  }
////===========================================================================================  icon
//  iconContainer(givenIcon, givenColor, double givenSize) {
//    return Icon(
//      givenIcon,
//      color: givenColor,
//      size: givenSize,
//    );
//  }
//  //===========================================================================================    build boby
//  Widget _buildRow(BuildContext context,String date ,String status ,String name,String message ) {
//    double height = MediaQuery.of(context).size.height;
//
//    double width = MediaQuery.of(context).size.width;
//
//    return Card(
//      elevation: 1,
//
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
////          ==========================================================
//          Container(width: width*.3,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Container(
//                      child: Text(
//                        date,
//                        textDirection: TextDirection.rtl,
//                        style: TextStyle(
//                          fontSize: width*.03,
//                          fontFamily: 'ArbFONTS-59GE-SS-Two',
//                          color: grayColor,
//                        ),
//                      ),
//                    ),
//
//
//
//
//                    iconContainer(Icons.timer, grayColor, width*.05),
//
//                  ],
//                ),
//
//                heightSizedBox(context, .01),
////===========================================================================================
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Text(
//                      status,
//                      style: TextStyle(color:grayColor, fontSize: width*.03,fontFamily: 'ArbFONTS-59GE-SS-Two',),
//                    ),
//
//
//
//                    iconContainer(Icons.check_circle, Colors.green, width*.05),
//
//                  ],
//                ),
//
//
//              ],
//
//            ),
//          ),
////          ===================================================
//
//
//          Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              heightSizedBox(context, .03),
//
//              Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//
//
//
//                  myText(  name, blackColor,width*0.03),
//                ],
//              ),
//
//              heightSizedBox(context, .01),
//              //===========================================================================================
//              Container(width: width*.5,margin: EdgeInsets.only(right: width*.02),
//                child: Text(
//                  message,
//                  style: TextStyle(color:grayColor, fontSize: width*.02,fontFamily: 'ArbFONTS-59GE-SS-Two',),maxLines: 7,textDirection: TextDirection.rtl,
//                ),
//              ),
//              heightSizedBox(context, .03),
//
//
//
//            ],
//
//          ),
//
//          Container(
//              height: height*.1,
//              width: width*.02,
//              decoration: new BoxDecoration(
//                  border: Border.all(color: redColor),
//                  borderRadius: BorderRadius.circular(width*.01),
//                  color: redColor)
//          ),
//
//        ],
//      ) ,
//    );
//
//  }
//  //===========================================================================================   default text
//  myText(String givenText, Color givenColor, double givenSize) {
//    return Text(
//      givenText,
//      style: TextStyle(color: givenColor, fontSize: givenSize,fontFamily: 'ArbFONTS-59GE-SS-Two',fontWeight: FontWeight.bold),
//    );
//  }
//}
////===========================================================================================    ??????
//UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
//
//dynamic userModelToJson(UserModel data) => json.encode(data.toJson());
////===========================================================================================   mode
//class UserModel {
//  String id;
//  String message ;
//  String result ;
//  List data ;
//  //===========================================================================================  constructor
//  UserModel({
//    this.id,
//    this.message,
//    this.result,
//    this.data,
//  });
////=========================================================================================== from json
//  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
//    id: json["id"],
//    message : json["message"],
//    result :json["result"],
//    data :json["data"],
//
//  );
////===========================================================================================  to json
//  Map<dynamic, dynamic> toJson() => {
//    "id" : id ,
//    "message":message,
//    "result":result,
//    "data": data
//  };
//}
////===========================================================================================    colors
//const whiteColor = Colors.white;
//const redColor = Color(0xff990000);
//const pinkColor = Colors.pink;
//const secondaryWhiteColor = Color(0xFFEEEEEE);
//const blackColor = Color(0xFF424242);
//const grayColor = Colors.grey;
//
