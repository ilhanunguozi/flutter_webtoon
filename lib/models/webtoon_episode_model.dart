class WebtoonEpisodeModel {
  final String id, title, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        date = json['date'],
        id = json['id'],
        rating = json['rating'];

}