import 'package:chatapp/controllers/chat_controller.dart';
import 'package:chatapp/features/screens/chat_screen.dart';
import 'package:chatapp/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComposeScreen extends StatelessWidget {
  const ComposeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'New Message',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        
        child: StreamBuilder(
            stream: StoreServices.getAllUsers(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, ),
                    itemBuilder: (context, index) {
                      var doc = snapshot.data!.docs[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Container(
                          
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 35,
                                  child: doc["image_url"] == ""
                                      ? Image.asset("assets/icons/ic_user.png")
                                      : Image.network(doc["image_url"]),
                                ),
                                /// issue name exceed things 
                                title: Text("${doc["name"]}",style: TextStyle(fontWeight: FontWeight.w600),),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                               margin: EdgeInsets.symmetric(horizontal: 16), 
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      padding: const EdgeInsets.all(8),
                                      backgroundColor: Colors.black),
                                  onPressed: () {
                                    
                                    Get.to(()=> const ChatScreen(),
                                        transition: Transition.downToUp,
                                        arguments: [
                                          doc['name'],
                                          doc['id'],
                                        ],);
                                        
                                  },
                                  icon: const Icon(Icons.message,
                                      color: Colors.white),
                                  label: const Text(
                                    "Message",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  print("ERror");
                  return Center(
                    child: Text("${snapshot.hasError.toString()}"),
                  );
                } else {
                  return const Center(
                    child: Text("NO Data Found"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
