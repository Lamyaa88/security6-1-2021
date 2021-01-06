class RegistrationModel {

  final String name;
  final List  email;
  final String password ;
  final String mobile ;



  RegistrationModel({this.name, this.email,this.password,this.mobile});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(

     name: json['name'],
      email: json['email'],
     password: json['password'],
      mobile: json['mobile']
    );
  }
}




