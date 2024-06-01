import 'package:chatapp/features/screens/chat_screen.dart';
import 'package:chatapp/features/screens/status_screen.dart';
import 'package:chatapp/features/widgets/chat_widget.dart';
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

