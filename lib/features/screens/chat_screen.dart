import 'dart:html';

import 'package:chatapp/constants/firebase_const.dart';
import 'package:chatapp/controllers/chat_controller.dart';
import 'package:chatapp/features/widgets/message_widget.dart';
import 'package:chatapp/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());
    String chatId;
    map() async {
      chatId = await controller.chatId;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: const [
            Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            )
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
                child: Row(
                  children: [
                    // last seen changes can be implied
                    Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                      TextSpan(
                          text: "${controller.friendname}\n",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: "Last seen",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500)),
                    ]))),
                    const CircleAvatar(
                      child: Icon(Icons.video_call_rounded),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      child: Icon(Icons.call_rounded),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //  some changes more required
              FutureBuilder(
                  future: controller.fetchChatId(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting || controller.chatId==null) {
                      return Expanded(
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else {
                      // return Container(color: Colors.red,height: 100,width: 100,);
                      return 
                     
                      Expanded(
                        child: StreamBuilder(
                          stream: StoreServices.getChats(controller.chatId!),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            // print("this is poitnL ${snapshot.data!.docs.length}");
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.active) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 8,
                                  ),
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return 
                                    // Container(
                                    //   color: Colors.red,
                                    //   height: 100,
                                    //   width: 100,
                                    // );
                                        MessageWidget(
                                      index: index,
                                      docs: snapshot.data!.docs[index],
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                print("ERror");
                                return Center(
                                  child:
                                      Text("${snapshot.hasError.toString()}"),
                                );
                              } else {
                                return Center(
                                  child: Text("NO Data Found"),
                                );
                              }
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      );
                    }
                  }),

              // beutify this
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                height: 56,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16)),
                        child: TextFormField(
                          controller: controller.messagecontroller,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.attachment_rounded,
                                color: Colors.white54,
                              ),
                              prefixIcon: Icon(
                                Icons.emoji_emotions_rounded,
                                color: Colors.white54,
                              ),
                              border: InputBorder.none,
                              hintText: "Type a message here....",
                              hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.postMessage(
                            controller.messagecontroller.text.toString());
                      },
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
