import 'package:chatapp/constants/strings.dart';
import 'package:flutter/material.dart';

class Etabbar extends StatelessWidget {
  const Etabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      
      child:  RotatedBox(
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