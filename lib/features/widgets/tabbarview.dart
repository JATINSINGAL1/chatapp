import 'package:chatapp/features/screens/chat_screen.dart';
import 'package:chatapp/features/screens/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class tabbarview extends StatelessWidget {
  const tabbarview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        const ChatsWidget(),
        const StatusScreen(),
        Container(
          color: Colors.red,
        ),
      ]),
    );
  }
}

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
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
            onTap: () {
              Get.to(()=>const ChatScreen(), transition: Transition.downToUp);
            },
            leading: const CircleAvatar(
              radius: 20,
              // backgroundImage: AssetImage("assets/icons/ic_user.png"),
              child: Icon(Icons.man),
            ),
            title: const Text("Dummy Person"),
            titleTextStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            subtitle: const Text(
              "Message here...",
              style: TextStyle(fontSize: 14),
            ),
            trailing: Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.access_time_filled_rounded,size: 16,),
                  label: const Text(
                    "Last Seen",
                    style: TextStyle(fontSize: 12),
                  ),
                ))),
      ),
    );
  }
}
