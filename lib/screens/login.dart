// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatelessWidget {
   ScreenLogin({super.key});

  final _usernamecontroller=TextEditingController();
  final _passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 207, 42),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Image.asset('assets/images/wechatsquare.webp',height: 200,),
              TextFormField(
                controller: _usernamecontroller,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  hintText: 'User Name',hintStyle:TextStyle(color: Colors.white) ,                  
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  hintText: 'Password',hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,minimumSize: Size(120 , 40)),
                onPressed: () {
                 checklogin(context);
                },                
               child:Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }



  void checklogin(BuildContext ctx) async {
    final _username=_usernamecontroller.text;
    final _password=_passwordcontroller.text;

    if(_username=='admin'&&_password=='1234'){
    //go to home

    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.setBool(SAVE_KEY_NAME, true);


    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>Screenhome()));
    }
    else{
      final _error='User Name And Password Does Not Match';
      //snackbar
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color.fromARGB(255, 236, 66, 66),
          margin: EdgeInsets.all(50),
          duration: Duration(seconds: 5),
          content: Text(_error)
        ),
      );

    }
  }
}