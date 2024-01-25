import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_news_app/homepage.dart';
import 'package:sport_news_app/newdetail.dart';
  
void main() {
  runApp(const SportNewsApp());
}

class SportNewsApp extends StatefulWidget {
  const SportNewsApp({super.key});

  @override
  State<SportNewsApp> createState() => _SportNewsAppState();
}

class _SportNewsAppState extends State<SportNewsApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepage',
      getPages: [
        // GetPage(name: '/', page: () => const Splash()),
        GetPage(name: '/homepage', page: () => const HomePage()),
        GetPage(
            name: '/newdetail',
            page: () => NewsDetail(
                  data: const {"title": ""},
                )),
      ],
    );
  }
}
