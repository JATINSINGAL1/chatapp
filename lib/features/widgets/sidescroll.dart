import 'package:chatapp/constants/firebase_const.dart';
import 'package:chatapp/constants/sidescrolldata.dart';
import 'package:chatapp/features/screens/onboardingscreen.dart';
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
              title:const Text("Settings",style: TextStyle(color: Colors.white),),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
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
            const Text("Username",style:  TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
            const SizedBox(height:20 ,),
            const Divider(),
            ListView(
              shrinkWrap: true,
              children: List.generate(icons.length, (index) {
                return ListTile(
                  onTap: (){
                    switch (index) {
                      case 0: { Get.to(const ProfileScreen());}
                        
                        break;
                      default:
                    }
                  },
                  leading: Icon(icons[index],color: Colors.white,),
                  title: Text(labelText[index],style:const TextStyle(color: Colors.white),),
                );
              }  ),
            ),
            const Divider(height:0.5),
            const SizedBox(height: 10,),
            const ListTile(
              title: Text("Invite a friend",style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.emoji_people_rounded,color: Colors.white,),
            ),
        
            const Spacer(),

            ListTile(
              onTap: ()async{
              await  auth.signOut();
              Get.off(const OnBoardingScreen());
              },
              title: const Text("Logout",style: TextStyle(color: Colors.white),),
              leading: const Icon(Icons.logout_rounded,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
