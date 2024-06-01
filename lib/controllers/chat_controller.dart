import 'package:chatapp/constants/firebase_const.dart';
import 'package:chatapp/constants/strings.dart';
import 'package:chatapp/controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
   dynamic   chatId ;
  var chats = fstore.collection(collectionChats);

  var userId = currentuser!.uid;
  var friendId = Get.arguments[1];
  // now we are able to see the use of static HomeController instance = Get.find();
  var username = HomeController.instance.pref.getStringList("user_details")![0];

  var friendname = Get.arguments[0];
  var messagecontroller = TextEditingController();

  // creating  chat room
  var isloading = true.obs;

  Future<void> fetchChatId() async {
    print(" funcitn me enter kiya mane");
    isloading(true);
    try {
      await chats
          .where('users', isEqualTo: {
            "$friendId": null,
            userId: null
          }) // this is fetching the data from
          .limit(1) //
          .get()
          .then((QuerySnapshot snapshot) async {
            if (snapshot.docs.isNotEmpty) {
              // chat room already there
              print("reache till here");
             
              chatId = snapshot.docs.single["chatId"];
              print(chatId.toString());
            } else {
              // create a chat id
              await chats.add({
                "users": {friendId: null, userId: null},
                "friend_name": friendname,
                "user_name": username,
                "toId": "",
                "fromId": "",
                "created_on": null,
                "last_msg": "",
              }).then((value) {
                chatId = snapshot.docs.single["chatId"];
                    
              });
              print("chatId1:");
            }
          });
    } catch (e) {
      print("Error fetching/creating chat ID: $e");
    }

    isloading(false);
  }

  postMessage(String msg) {
    if (msg.trim().isNotEmpty) {
      chats.doc(chatId).update({
        "toId": friendId,
        "fromId": userId,
        "last_msg": msg,
        "created_on": FieldValue.serverTimestamp()
      });
      // we are creating that messages data to store in that document itself
      chats.doc(chatId).collection(collectionMessages).doc().set({
        "created_on": FieldValue.serverTimestamp(),
        "msg": msg,
        // to tell who send the message
        "uid": userId
      }).then((value) => messagecontroller.clear());
    }
  }

  @override
  void onInit() async {
    print("chat controler onInt clalled");
    await fetchChatId();
    super.onInit();
  }
}
