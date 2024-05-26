import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green.shade700, width: 2.5)),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.red,
                child: Image.asset(
                  "assets/icons/ic_user.png",
                  color: Colors.white,
                ),
              ),
            ),
            title: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "My status\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14)),
              TextSpan(
                  text: "Tap to add status updates",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12))
            ])),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Recent Updates",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.green.shade700, width: 2.5)),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black,
                      child: Image.asset(
                        "assets/icons/ic_user.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: const Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    "Today, 8:30 PM",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
