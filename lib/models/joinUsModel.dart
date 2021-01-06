class JoinUsModel {

  final String result;
  final String  name;
  final String civilRegistrationNo ;
  final String gender;
  final String email;
  final String phoneNumber;
  final String address ;
  final String resume;


  JoinUsModel({this.result, this.name,this.civilRegistrationNo,
    this.gender,this.email,this.phoneNumber,this.address,this.resume});

  factory JoinUsModel.fromJson(Map<String, dynamic> json) {
    return JoinUsModel(

      result: json['result'],
      name: json['name'],
      civilRegistrationNo: json['civil'],
      gender: json['gender'],
      email: json['email'],
      phoneNumber: json['phone'],
      address: json['address'],
      resume: json['resume'],
    );
  }
}