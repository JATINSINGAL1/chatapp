import 'package:chatapp/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sidescrool extends StatelessWidget {
  const sidescrool({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
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
          ListTile(
            title: Text(account,style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.account_circle,color: Colors.white,),
          ),
          
          ListTile(
            title: Text("Friends",style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.people,color: Colors.white,)
          ),
          
          
          ListTile(
            title: Text("Notifications",style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.notifications,color: Colors.white,),),
          
          ListTile(
            title: Text("Data and Storage",style: TextStyle(color: Colors.white),),
            leading:  Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
          ),
          
          ListTile(
            title: Text("Help",style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.help,color: Colors.white,),
          ),
          const Divider(height:0.5),
          ListTile(
            title: Text("Invite a friend",style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
          ),

          Spacer(),
          ListTile(
            title: Text("Logout",style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.logout,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
