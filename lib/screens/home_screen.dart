import 'package:flutter/material.dart';
import 'package:flutter_webtoon/service/api_service.dart';

import '../models/webtoon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebtoons() async {
    webtoons = await ApiService().getTodaysToons();
    isLoading = false;

    setState(() {

    });

  }

  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            "오늘의 웹툰"
           , style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600
            )
          ,
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),

    );
  }
}
