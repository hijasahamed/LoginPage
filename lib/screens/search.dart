import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
   ScreenSearch({super.key});
  
final controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 56, 96, 57),
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,borderRadius: BorderRadius.circular(5)         
        ),
        child: Center(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(onPressed: () {controller.clear();}, icon:Icon(Icons.clear) ),
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
     ),
    );
  }
}