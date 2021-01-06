class AbutUsModel {
  final String result;
  final List  data;
  final String message ;
  final String baseURL = 'https://www.n5ba.com/gaurds/';



  AbutUsModel({this.result, this.data,this.message});

  factory AbutUsModel.fromJson(Map<String, dynamic> json) {
    return AbutUsModel(
      result: json['result'],
      data: json['data'],
      message: json['message'],
    );
  }
}