import 'package:chatapp/constants/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class tabbar extends StatelessWidget {
  const tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      child: const RotatedBox(
        quarterTurns: -1,
        child: TabBar(
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14


          ),
          indicator: BoxDecoration(),
          labelColor: Colors.white,
          dividerColor: Colors.black,
          tabs: [
          Tab(text: chats,),
          Tab(text: status,),
          Tab(text: camera,),
        ],
        
        ),
      ),
    );
  }
}