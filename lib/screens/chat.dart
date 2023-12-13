import 'package:flutter/material.dart';
import 'package:login/screens/home.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const  Color.fromARGB(255, 16, 155, 20),
        leading: IconButton(
          onPressed: (){
            back(context);
          }, 
          icon: const Icon(Icons.arrow_back,color: Colors.white,)
        ),
        title: const Text('Person',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call,color: Colors.white,)),
          IconButton(onPressed: () {}, icon:const Icon(Icons.video_call_rounded,color: Colors.white,)),
          IconButton(onPressed: () {}, icon:const Icon(Icons.menu,color: Colors.white,))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        selectedFontSize: 15 ,
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'mic',
          ),
        ],
      ),
    );    
  }
}