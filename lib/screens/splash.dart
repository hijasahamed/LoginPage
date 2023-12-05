import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

  @override
  void initState() {
    CheckUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 245, 245),
      body: Center(
        child: Image.asset('assets/images/wechat.png',height:300,),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotologin() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx){
          return ScreenLogin();
        }
      )
    );
  }

  Future<void> CheckUserLoggedIn() async{
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userLoggedIn=_sharedprefs.getBool(SAVE_KEY_NAME);

    if(_userLoggedIn== null || _userLoggedIn == false){
      gotologin();
    }
    else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Screenhome()));
    }
  }
}