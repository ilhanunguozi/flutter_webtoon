import 'dart:convert';

import 'package:flutter_webtoon/models/webtoon_detail_model.dart';
import 'package:flutter_webtoon/models/webtoon_episode_model.dart';
import 'package:http/http.dart' as http;

import '../models/webtoon.dart';


class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  //fetch
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstatnces = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for(var webtoon in webtoons) {
        webtoonInstatnces.add(WebtoonModel.fromJson(webtoon));

      }
      return webtoonInstatnces;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id ) async {
    WebtoonDetailModel webtoonDetail;
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      webtoonDetail = WebtoonDetailModel.fromJson(webtoon);
      return webtoonDetail;
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(String id ) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for(var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}

