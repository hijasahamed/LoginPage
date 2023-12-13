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
        backgroundColor:const Color.fromARGB(255, 16, 155, 20),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration:const  BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/wechatsquare.webp')),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
            ),
            const SizedBox(width: 10,),
            const Text(
              'Wee chat',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) { return ScreenSearch();}));
           },
           icon: const Icon(Icons.search,color: Colors.white,)
          ),
          TextButton(
            onPressed: () {
            showDialog(
              context: context, 
              builder: (ctx1) {
                return AlertDialog(
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
                        back(context);
                      }, 
                      child: Text('No')
                    )
                  ],
                );
              }
            );  
          }, 
          child: const Text('Logout',style:TextStyle(color: Colors.white),)
         )
        ],
      ),


      body:SafeArea(       
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (ctx,index){
            return ListTile(
              title: const Text('Person'),
              subtitle: const Text('hey there iam using weechat'),
              leading:index.isEven ?const CircleAvatar(
                radius:25,
                backgroundImage: AssetImage('assets/images/user image.jpg'),
              )
              :const Image(width: 50 , image:AssetImage('assets/images/user2.jpg'),),
              trailing: Column(
                children: [
                  Text('${index+1}:47 pm'),
                  const SizedBox(height: 10,),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green,
                    child: Text('${index+1}'),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Chatscreen()));                
              },
            );
          }, 
          separatorBuilder: (ctx,index){
            return const Divider(height: 10,);
          }, 
          itemCount: 15 ,
        ),
      ),
    );
  }



  signout(BuildContext ctx) async{
  final sharedprefs = await SharedPreferences.getInstance();
  await sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx)=>ScreenLogin()), (route) => false);
  }
}


 back(BuildContext ctx ) {
  Navigator.of(ctx).pop();
 }
