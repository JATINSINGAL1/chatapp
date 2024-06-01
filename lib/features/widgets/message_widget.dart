import 'package:chatapp/constants/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.index, required this.docs});
  final int index;
  final DocumentSnapshot docs ;
  @override
  Widget build(BuildContext context) {
    var t = docs["created_on"] == null ? DateTime.now() : docs["created_on"].toDate();
    var time =intl.DateFormat("h:mma").format(t);
    return Directionality(
      textDirection: docs["uid"] == currentuser!.uid
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: docs["uid"] == currentuser!.uid
                ? Colors.black
                : Colors.red,
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
                color: docs["uid"] == currentuser!.uid
                    ? Colors.black
                    : Colors.red,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${docs["msg"]}",
              textDirection: TextDirection.ltr,
              softWrap: true,
              
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
              child: Text(
            textAlign: docs["uid"] == currentuser!.uid
                ? TextAlign.start
                : TextAlign.end,
            time.toString(),
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            textDirection: TextDirection.ltr,
          )),
        ],
      ),
    );
  }
}
