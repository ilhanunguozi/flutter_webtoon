import 'package:flutter/material.dart';
import 'package:flutter_webtoon/service/api_service.dart';

import '../models/webtoon.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                print(index);
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// class _HomeScreenState extends State<HomeScreen> {
//
//   List<WebtoonModel> webtoons = [];
//   bool isLoading = true;
//
//   void waitForWebtoons() async {
//     webtoons = await ApiService.getTodaysToons();
//     isLoading = false;
//
//     setState(() {
//
//     });
//
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     waitForWebtoons();
//   }
