import 'package:chatapp/constants/sidescrolldata.dart';
import 'package:chatapp/constants/strings.dart';
import 'package:chatapp/features/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sidescrool extends StatelessWidget {
  const sidescrool({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ListTile(
              title: Text("Settings",style: TextStyle(color: Colors.white),),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            const SizedBox(height: 20,),
             CircleAvatar(
               radius: 45,
               backgroundColor: Colors.grey,
              child:Image.asset("assets/icons/ic_user.png",color: Colors.white,),
              
            ),
            const SizedBox(height: 10,),
            Text("Username",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
            const SizedBox(height:20 ,),
            const Divider(),
            ListView(
              shrinkWrap: true,
              children: List.generate(icons.length, (index) {
                return ListTile(
                  onTap: (){
                    switch (index) {
                      case 0: { Get.to(ProfileScreen());}
                        
                        break;
                      default:
                    }
                  },
                  leading: Icon(icons[index],color: Colors.white,),
                  title: Text(labelText[index],style: TextStyle(color: Colors.white),),
                );
              }  ),
            ),
            const Divider(height:0.5),
            SizedBox(height: 10,),
            ListTile(
              title: Text("Invite a friend",style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.emoji_people_rounded,color: Colors.white,),
            ),
        
            Spacer(),

            ListTile(
              title: Text("Logout",style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.logout_rounded,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
