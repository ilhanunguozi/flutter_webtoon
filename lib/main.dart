import 'package:flutter/material.dart';
import 'package:flutter_webtoon/screens/home_screen.dart';
import 'package:flutter_webtoon/service/api_service.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
