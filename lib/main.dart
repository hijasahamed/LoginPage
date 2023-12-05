import 'package:flutter/material.dart';
import 'package:login/screens/splash.dart';

const SAVE_KEY_NAME ='UserLoggedIn';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login_Sample',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: ScreenSplash(),
    );
  }
}