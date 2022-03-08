import 'package:flutter/material.dart';
import 'package:quiz_app/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/LoadJsonPage.dart';
import 'package:quiz_app/ResultPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
