import 'package:flutter/material.dart';
import 'package:todo/app/pages/splash/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.dark,
        primaryTextTheme: TextTheme(
            headline6: TextStyle(
          color: Colors.white,
        )),
        primaryIconTheme: const IconThemeData.fallback().copyWith(
          color: Colors.white,
        ),
      ),
      home: SplashPage(),
    );
  }
}
