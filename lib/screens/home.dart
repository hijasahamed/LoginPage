import 'package:flutter/material.dart';
import 'package:login/screens/chat.dart';
import 'package:login/screens/login.dart';
import 'package:login/screens/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screenhome extends StatelessWidget {
  const Screenhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 96, 57),
        automaticallyImplyLeading: false,
        title:const Text(
          'Wee chat',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        // toolbarHeight: 10  ,
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) { return ScreenSearch();}));
           },
           icon: Icon(Icons.search)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [              
              TextButton(onPressed: () {
                showDialog(
                  context: context, 
                  builder: (ctx1) {
                    return AlertDialog(
                      // title: Text('Do you want to logout'),
                      content: Text('Do you want to logout'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            signout(context);
                          }, 
                          child: Text('Yes')
                        ),
                         TextButton(
                          onPressed: () {
                            // Navigator.of(context).pop();
                            back(context);
                          }, 
                          child: Text('No')
                        )
                      ],
                    );
                  }
                );  
              }, 
              child: Text('Logout',style:TextStyle(color: Colors.white),)
            ),
            ],
          )
        ],
      ),


      body:SafeArea(       
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (ctx,index){
            return ListTile(
              // minVerticalPadding: 25 ,
              title: Text('Person'),
              subtitle: Text('hey there iam using weechat'),
              leading:index.isEven ?CircleAvatar(
                radius:25,
                backgroundImage: AssetImage('assets/images/user image.jpg'),
              )
              :Image(width: 50 , image:AssetImage('assets/images/user2.jpg'),),
              trailing: Column(
                children: [
                  Text('${index+1}:47 pm'),
                  SizedBox(height: 10,),
                  // CircleAvatar(
                  //   child: Text('${index+1}'),
                  //   radius: 12,
                  //   backgroundColor: Colors.green,
                  // )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Chatscreen()));
                // showDialog(
                //   context: context, 
                //   builder: (ctx) {
                //     return AlertDialog(
                //       title: Text('Clicked on $index'),

                //     );
                //   }
                // );
              },
            );
          }, 
          separatorBuilder: (ctx,index){
            return Divider(height: 10,);
          }, 
          itemCount: 15 ,
        ),
      ),
    );
  }



  signout(BuildContext ctx) async{
  final _sharedprefs = await SharedPreferences.getInstance();
  await _sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx)=>ScreenLogin()), (route) => false);
  }
}


 back(BuildContext ctx ) {
  Navigator.of(ctx).pop();
 }
