class MyAccountModel {
  final String name;
  final List  email;
  final String phone ;
  final String password ;



  MyAccountModel({this.name, this.email,this.phone,this.password});

  factory MyAccountModel.fromJson(Map<String, dynamic> json) {
    return MyAccountModel(
      name: json['result'],
      email: json['data'],
      phone: json['message'],
      password:json['password']
    );
  }
}