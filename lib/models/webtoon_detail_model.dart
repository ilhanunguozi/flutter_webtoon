import 'package:flutter_webtoon/widget/webtoon_widget.dart';

class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json) :
      title = json['title'],
      about = json['about'],
      age = json['age'],
      genre = json['genre'];

}