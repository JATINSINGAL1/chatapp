import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class tabbarview extends StatelessWidget {
  const tabbarview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        
        children:[
        
        Container(color: Colors.yellow,),
        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          
                          
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            
                            itemCount: 15,
                            itemBuilder: (context, index) =>  ListTile(
                              leading: CircleAvatar(
                                // backgroundImage: AssetImage("assets/icons/ic_user.png"),
                                child: Icon(Icons.man),
                              ),
                              title: Text("Dummy Person"),
                              titleTextStyle: TextStyle(
                                  fontWeight: FontWeight.w700, color: Colors.black),
                              subtitle: Text("Message here..."),
                              trailing: Text("Last seen",style: TextStyle(color: Colors.grey),),
                              
                            ),
                          ),
                        ),
                        Container(color: Colors.red,),
      ]),
    );
  }
}