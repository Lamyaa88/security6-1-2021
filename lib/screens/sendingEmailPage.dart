import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_email_sender/flutter_email_sender.dart';




class HomeEmail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeEmailState();
  }
}

class _HomeEmailState extends State<HomeEmail> {
  var _emailFormKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

// TODO: implement build
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: redColor,
        title: Text(""),
      ),
      body: Form(
        key: _emailFormKey,
        child: ListView(
            children: <Widget>[
//            Container(
//              margin: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
//              child: TextFormField(
//                controller: emailController,
//                validator: (value){
//                  if(value.isEmpty) {
//                    return "please Enter email";
//                  }
//                },
//                decoration: InputDecoration(
//                    labelText: "Enter email",
//                    border: OutlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.red,
//                          width: 2.0,
//                        ))),
//              ),
//            ),
//            Container(
//              margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
//              child: TextFormField(
//                controller: messageController,
//                validator: (value){
//                  if(value.isEmpty) {
//                    return "من فضلك أدخل رسالة";
//                  }
//                },
//                decoration: InputDecoration(
//                    labelText: "Enter Message",
//                    border: OutlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.red,
//                          width: 2.0,
//                        ))),
//              ),
//
//            ),


//            Container(
//              margin: EdgeInsets.only(top: 15.0),
//              child: RaisedButton(child: Text("Send"), onPressed: (){
//                if(_emailFormKey.currentState.validate()){
//                  sendMessage();
//                }
//              }),
//            )
              heightSizedBox(context, 0.1),

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
                                (controller: messageController,
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

                        padding: EdgeInsets.only(right: height*.01,),
                        decoration: new BoxDecoration(
                            border: Border.all(color:secondaryWhiteColor),
                            borderRadius: BorderRadius.circular(30),
                            color: secondaryWhiteColor)),
                  ],
                ),
              ),
              heightSizedBox(context, 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: width * .7,
                      child: Center(
                        child: InkWell(
                            onTap: (){
                              if(_emailFormKey.currentState.validate()){
                                sendMessage();
                              }
                            },
                            child: myText('ارسال', whiteColor, 15)
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

      ),
    );
  }
  void sendMessage(){
    String inputEmail ;
    String inputMessage;
    Email email ;
    setState(() {
      inputEmail= "info@hrasat.com";
      inputMessage = messageController.text;
      if(inputMessage.isNotEmpty&&inputEmail.isNotEmpty) {
        email = Email(
          body: inputMessage,
          subject: 'Email subject',
          recipients: [inputEmail],
        );
        send(email);
      }

    });
    debugPrint('email - > $inputEmail  message -> $inputMessage');

  }
  void send(Email email) async {
    await FlutterEmailSender.send(email);
  }


  Widget _buildBody(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
//===================================================================================================== all text fields


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Center(
                child: myText( "لا يوجد طلبات لعرضها ",redColor,height*.02) ,
              ),
              heightSizedBox(context, .2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: width * .7,
                      child: Center(
                        child: InkWell(
                            onTap: ()  {

                            },
                            child: myText('تسجيل الدخول ', whiteColor, 15)
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
          )




//          ==============================================================================================================
//                                                   this part just  for debugging
//          ==============================================================================================================

          , heightSizedBox(context, .04),

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

  Widget radiusContainer(BuildContext context, String givenText,
      double givenPadding, secure, controller) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            width: width * .82,
            child: Center(


                //=================================================================================================================== text field
                child: TextFormField(
                  maxLines: 7,

                  //==================================================================================================================controller
                  controller: controller,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.end,
                  showCursor: true,
                  autofocus: true,
                  obscureText: secure,
                  cursorColor: secondaryWhiteColor.withOpacity(.0001),
                  cursorWidth: .0000022,
                  enableInteractiveSelection: true,
                  textInputAction: TextInputAction.next,
                  decoration: new InputDecoration(
                    focusColor: redColor,
                    hintText: givenText,
                    hintStyle: TextStyle(
                        fontSize: 12, fontFamily: 'ArbFONTS-59GE-SS-Two'),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color:redColor),
                    ),
                    labelStyle: new TextStyle(color: redColor),
                    hasFloatingPlaceholder: true,

                    isDense: true,
                    hoverColor: redColor,
                    border: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                        color: redColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blue.shade900.withOpacity(.0001)),
                    ),
                  ),
                ),

            ),
            height: height * .07,
            padding: EdgeInsets.only(right: givenPadding),
            decoration: new BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
                color: whiteColor)),
      ],
    );
  }

}

const whiteColor = Colors.white;
const redColor = Color(0xff990000);
const pinkColor = Colors.pink;
const secondaryWhiteColor = Color(0xFFEEEEEE);
const blackColor = Color(0xFF424242);
const grayColor = Colors.grey;