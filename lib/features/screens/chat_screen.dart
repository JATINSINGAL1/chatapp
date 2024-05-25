import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                      TextSpan(
                          text: "Username\n",
                          style: TextStyle(
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
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: 15,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Directionality(
                      textDirection:
                          index.isEven ? TextDirection.rtl : TextDirection.ltr,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                index.isEven ? Colors.black : Colors.red,
                            child: Image.asset(
                              "assets/icons/ic_user.png",
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.sizeOf(context).width * 0.55,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
                            decoration: BoxDecoration(
                                color: index.isEven ? Colors.black : Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              textDirection: TextDirection.ltr,
                              softWrap: true,
                              "Hello lorenmaojl ljdofij aodsalkj jaitndlk iadnflkuj jdfhoij jnsdoif",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Text(
                            textAlign:
                                index.isEven ? TextAlign.start : TextAlign.end,
                            "11:00 AM",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                            textDirection: TextDirection.ltr,
                          ))
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                height: 56,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16)),
                        child: TextFormField(
                          
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.attachment_rounded,color: Colors.white54,),
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
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 16,
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
