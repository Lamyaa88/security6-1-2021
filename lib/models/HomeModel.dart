class HomeModel {

  String id;
  String  title;
  String image ;
  String content;
  String  date;





  HomeModel({this.id, this.title,this.image,this.content,this.date});

   HomeModel.fromJson(Map<String, dynamic> map ) {
     this.id = map["data"][0]['id'];
     this.title = map ["data"][0]["title"];
     this.image = map ["data"][0]['image'];
     this.content = map ["data"][0]['content'];
     this.date = map ["data"][0]['date'];



   }
}