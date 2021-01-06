class NewsModel {

  final String result;
  final List  data;
  final String message ;



  NewsModel({this.result, this.data,this.message});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(

      result: json['result'],
      data: json['data'],
      message: json['message'],
    );
  }
}