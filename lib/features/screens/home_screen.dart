

import 'package:chatapp/constants/strings.dart';
import 'package:chatapp/features/widgets/appbar.dart';
import 'package:chatapp/features/widgets/sidescroll.dart';
import 'package:chatapp/features/widgets/tabbar.dart';
import 'package:chatapp/features/widgets/tabbarview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: sidescrool(),

          floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          
          backgroundColor: Colors.black,
          
          body:   Column(
            children: [
              appbar(  ),
              Expanded(
                child: Row(
                  children: [
                    tabbar(),
                    tabbarview(),
                  ],
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
