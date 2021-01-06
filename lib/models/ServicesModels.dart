class ServicesModel {
  final String result;
  final List  data;
  final String message ;



  ServicesModel({this.result, this.data,this.message});

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      result: json['result'],
      data: json['data'],
      message: json['message'],
    );
  }
}