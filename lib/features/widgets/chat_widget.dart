import 'package:chatapp/constants/firebase_const.dart';
import 'package:chatapp/controllers/chat_controller.dart';
import 'package:chatapp/features/screens/chat_screen.dart';
import 'package:chatapp/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: StreamBuilder(
            stream: fstore
                .collection(collectionChats)
                .where("users.${currentuser!.uid}", isEqualTo: null)
                .where('created_on',isNotEqualTo: null)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var docs = snapshot.data!.docs[index];
                      print("${docs['friend_name']}");
                      return ListTile(
                          onTap: () {
                            // issue route change has a problem

                            Get.to(
                              () => const ChatScreen(),
                              transition: Transition.downToUp,

                              arguments: [
                                docs['friend_name'],
                                docs['toId'],
                              ]
                            );
                          },
                          leading: const CircleAvatar(
                            radius: 20,
                            // backgroundImage: AssetImage("assets/icons/ic_user.png"),
                            child: Icon(Icons.man),
                          ),
                          title: Text(docs['friend_name']),
                          titleTextStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                          subtitle: Text(
                            docs['last_msg'],
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.access_time_filled_rounded,
                                  size: 16,
                                ),
                                label: const Text(
                                  "Last Seen",
                                  style: TextStyle(fontSize: 12),
                                ),
                              )));
                    });
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            }));
  }
}
