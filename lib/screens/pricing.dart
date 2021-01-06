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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:security/screens/home.dart';
import 'package:security/screens/notifications.dart';
import 'package:security/test/test6.dart';
import '../animated_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';


//=========================================================================================== api function
Future<UserModel> createUser(String type, String name, String phone,
    String email, String address, String message , customer_id) async {
  final String apiUrl = "http://gaurds.n5ba.com/The_json/AskBrices";
  final response = await http.post(apiUrl, body: {
    //=========================================================================================== required parameter
    "type": type,
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "message": message,
    " customer_id": customer_id
    //===========================================================================================
  });

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(response.body);

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

//=========================================================================================== pricing class
class Pricing extends StatefulWidget {
  Pricing(this.customer_Id1, {Key key}) : super(key: key);
  final String customer_Id1;



  @override
  _PricingState createState() {
    return _PricingState(customer_Id1);
  }
}


class _PricingState extends State<Pricing> {
//  ================================================================== get id to notifications
  String  userIdWillBeSentToNotificationsPage ;
  Future getIdToNotifications()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userIdWillBeSentToNotificationsPage = preferences.getString('id');
    });
  }
//  =========================================================================================== get id
  Future getId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      idSession = preferences.getString('id');
    });
  }


  final String customer_Id2 ;
  _PricingState(this.customer_Id2);
  //=========================================================================================== controllers

  final TextEditingController _nameecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _messagecontroller = TextEditingController();

  String idSession = "";
  String savedId = "replaced with stored  user id _ if no id => there is no stored id   ";
  String savedEmail = "replaced with stored  user email _ if no email => there is no stored email ";
  String savedPassword = "replaced with stored user password  _ if no password  => there is no stored password  ";
  String savedName = "replaced with stored user name  _ if no password  => there is no stored name  ";
  String savedPhone = "replaced with stored user phone   _ if no password  => there is no stored phone   ";


  //=========================================================================================== to fill drop down list of services
  var types = ["حراسة مناسبات", "حراسة أمن", "حراسة شخصية", "اختر نوع الخدمة "];
  //=========================================================================================== selected type is null
  var selectedType = "اختر نوع الخدمة ";
  var selectedServiceType = "0";

  //===========================================================================================
  UserModel _user;
  @override
  void initState() {
    getId();
    print(idSession);
    super.initState();
  }


  @override

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
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
                        widthSizedBox(context, .05),

                        InkWell(
                          child: iconContainer(
                              Icons.notifications, whiteColor, 20),
                          onTap: () {
                            Navigator.push(context,
                                SlideFromTopRoute(widget: Notifications6(userIdWillBeSentToNotificationsPage)));
                          },
                        ),
                        widthSizedBox(context, .2),
                        Text(
                          'طلب التسعير ',
                          style: TextStyle(
                              fontSize: 20,
                              color: whiteColor,
                              letterSpacing: 1,
                              fontFamily: 'ArbFONTS-59GE-SS-Two',
                              fontWeight: FontWeight.bold),
                        ),
                        widthSizedBox(context, .2),
                        InkWell(
                          child: iconContainer(
                              Icons.arrow_forward, whiteColor, 20),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) => Home()));
                            _nameecontroller.clear();
                            _phonecontroller.clear();
                            _emailcontroller.clear();
                            _addresscontroller.clear();
                            _messagecontroller.clear();


                          },
                        ),
                        widthSizedBox(context, .05),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    heightSizedBox(context, .04),
                  ],
                ))
              ],
            ),
          ),
//          =================================================== pading
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Card(
//              ===================================================== build body
              child: _buildBody(context),
//              =====================================================
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

//===========================================================================================build body
  Widget _buildBody(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
//
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: width * .82,
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[


//=========================================================================================== drop_down button
                          DropdownButton<String>(  icon:Icon(Icons.keyboard_arrow_down ,color: secondaryWhiteColor,size: .00001111,) ,
                            underline: Container(),
                            items: types.map((String selectItem) {
                              return DropdownMenuItem<String>(
                                  value: selectItem,
                                  child: Text(
                                    selectItem,
                                    style: TextStyle(
                                      color: grayColor,
                                      fontSize: height * .018,
                                      fontFamily: 'ArbFONTS-59GE-SS-Two',
                                    ),
                                  ),);
                            }).toList(),
                            onChanged: (String theLang) {
                              setState(() {
                                selectedType = theLang;
                                selectedServiceType =
                                    types.indexOf(selectedType).toString();
                              });
                              print(((types.indexOf(selectedType) - 1))
                                  .toString());
                            },
                            value: selectedType,
                          ),
                          //===========================================================================================  type of the service
//                          Container(
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//
//                              ],
//                            ),
//                          ),
                        ],
                      ),
                    ),
                  ),
                  height: height * .07,
                  padding: EdgeInsets.only(right: 0),
                  decoration: new BoxDecoration(
                      border: Border.all(color: secondaryWhiteColor),
                      borderRadius: BorderRadius.circular(30),
                      color: secondaryWhiteColor)),
            ],
          ),
//=========================================================================================== all fields except note and type
          heightSizedBox(context, .02),
          radiusContainer(context, 'الاسم', 10, 'ArbFONTS-59GE-SS-Two', null,
              _nameecontroller,TextInputType.text),
          heightSizedBox(context, .02),
          radiusContainer(context, 'رقم الجوال', 10, 'ArbFONTS-59GE-SS-Two',
              null, _phonecontroller,TextInputType.number),

          heightSizedBox(context, .02),
          radiusContainer(context, 'البريد الإلكتروني', 10,
              'ArbFONTS-59GE-SS-Two', null, _emailcontroller ,TextInputType.emailAddress),
          heightSizedBox(context, .02),
          radiusContainer(context, 'العنوان', 10, 'ArbFONTS-59GE-SS-Two', null,
              _addresscontroller,TextInputType.text),

          heightSizedBox(context, .02),

          //=========================================================================================== notes text field
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
                            (controller: _messagecontroller,
                            keyboardType: TextInputType.text,
                            textDirection: TextDirection.ltr,textAlign: TextAlign.end,showCursor: true,maxLines: 6,

                            decoration: new InputDecoration(focusColor: redColor,icon: IconButton( icon: Icon(null,color:grayColor
                              ,textDirection: TextDirection.rtl,),onPressed: (){}
                              ,disabledColor: grayColor,focusColor: grayColor,),counterStyle: TextStyle(

                            ),
                              hintText: 'الملاحظات',hintStyle: TextStyle(
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

//=========================================================================================== the button of sending
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell( onTap: () async {
    final String type =
    ((types.indexOf(selectedType) - 1)).toString();
    final String name = _nameecontroller.text;
    final String phone = _phonecontroller.text;
    final String email = _emailcontroller.text;
    final String address = _addresscontroller.text;
    final String message = _messagecontroller.text;
    final String customer_id =idSession;
    final UserModel user = await createUser(
    type, name, phone, email, address, message ,customer_id);
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
                          child: myText('إرسال الآن', whiteColor, 15)),
                    ),
                    height: height * .075,
                    padding: EdgeInsets.only(left: 1),
                    decoration: new BoxDecoration(
                        border: Border.all(color: redColor),
                        borderRadius: BorderRadius.circular(30),
                        color: redColor)),
              )
            ],
          ),
        ],
      ),
    );
  }

//============================================================== sized box

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

//=========================================================================================== icon
  iconContainer(givenIcon, givenColor, double givenSize) {
    return Icon(
      givenIcon,
      color: givenColor,
      size: givenSize,
    );
  }

//=========================================================================================== my text
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

//  =============================================================================================================================== a widget to build text field
  Widget radiusContainer(BuildContext context, String givenText,
      double givenPadding, String family, lable, controller ,type) {
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
                //=========================================================================================== text field
                child: TextFormField(
                  keyboardType: type,
                  controller: controller,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.end,
                  showCursor: true,
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
                        fontSize: 12, fontFamily: family, color: grayColor),
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
//  ============================================================================================== end of the widget
}

//===========================================================================================   ???????????????????????????????????????
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
//===========================================================================================colors

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;
//===========================================================================================
