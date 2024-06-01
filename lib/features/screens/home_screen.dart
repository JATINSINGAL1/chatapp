import 'package:chatapp/controllers/home_controller.dart';
import 'package:chatapp/features/screens/compose_screen.dart';
import 'package:chatapp/features/widgets/appbar.dart';
import 'package:chatapp/features/widgets/sidescroll.dart';
import 'package:chatapp/features/widgets/tabbar.dart';
import 'package:chatapp/features/widgets/tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: const sidescrool(),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => const ComposeScreen());
            },
          ),
          backgroundColor: Colors.black,
          body: const Column(
            children: [
              appbar(),
              Expanded(
                child: Row(
                  children: [
                    Etabbar(),
                    tabbarview(),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
