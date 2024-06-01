import 'dart:io';

import 'package:chatapp/constants/firebase_const.dart';
import 'package:chatapp/constants/strings.dart';
import 'package:chatapp/controllers/profile_controller.dart';
import 'package:chatapp/features/widgets/picker_dialog.dart';
import 'package:chatapp/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                if (controller.imgpath.isEmpty) {
                  controller.updateProfile();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Center(child: Text("Data Updated"))));
                } else {
                  await controller.uploadImage();
                  controller.updateProfile();
                }
              },
              child: const Text("Save",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)))
        ],
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: StoreServices.getUser(currentuser!.uid),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                // there are numerous types of snapshot
                if (snapshot.hasData) {
                  var data = snapshot.data!.docs[0];
                  // setting up things
                  controller.namecontroller.text = data["name"];
                  controller.phonecontroller.text = data["phone"];
                  controller.aboutcontroller.text = data["about"];
                  return Column(
                    children: [
                      Obx(

                        // issue loading problem data is not fetch so blank comes it should not be
                        () => CircleAvatar(
                          minRadius: 80,
                          maxRadius: 80,
                          backgroundColor: Colors.black,
                          child: Stack(
                            children: [
                              controller.imgpath.isEmpty &&
                                      data["image_url"] == ''
                                  ? Image.asset(
                                      "assets/icons/ic_user.png",
                                      color: Colors.white,
                                    )
                                  : Container(
                                      
                                      clipBehavior: Clip.antiAlias,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle,),
                                      child: controller.imgpath.isNotEmpty
                                          ? Image.file(
                                              File(controller.imgpath.value))
                                          : Image.network(data["image_url"])),
                              Positioned(
                                  right: 0,
                                  bottom: 20,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 20,
                                      child: IconButton(
                                        onPressed: () {
                                          Get.dialog(EpickerDialog(
                                            controller: controller,
                                          ));
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        title: TextFormField(
                          controller: controller.namecontroller,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: "Name",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                              suffixIcon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        ),
                        subtitle: Text(
                          namesub,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.info_rounded,
                          color: Colors.white,
                        ),
                        title: TextFormField(
                          controller: controller.aboutcontroller,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: "About",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                              suffixIcon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        title: TextField(
                          controller: controller.phonecontroller,
                          readOnly: true,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              prefixText: "+91",
                              prefixStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                              labelText: "Phone",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                }
              },
            )),
      ),
    );
  }
}
