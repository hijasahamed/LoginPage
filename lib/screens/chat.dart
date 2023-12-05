import 'package:flutter/material.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 96, 57),
        title: Text('Person'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
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