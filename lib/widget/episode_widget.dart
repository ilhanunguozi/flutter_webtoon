import 'package:flutter/material.dart';
import 'package:flutter_webtoon/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  final String webtoonId;
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId
  });

  final WebtoonEpisodeModel episode;

  onButtonTap() async {
     await launchUrlString("https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green, style: BorderStyle.solid, )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(episode.title, style: TextStyle(color: Colors.green, fontSize: 14),),
              Icon(Icons.chevron_right_rounded, color: Colors.green,),
            ],
          ),
        ),
      ),
    );
  }
}
