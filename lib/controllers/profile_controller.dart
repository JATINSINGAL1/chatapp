import 'dart:io';

import 'package:chatapp/constants/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  var phonecontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var aboutcontroller = TextEditingController();

  var imgpath = "".obs;
  var imglink = "";

  updateProfile() async {
    var store = fstore.collection("Users").doc(currentuser!.uid);
    await store.set({
      "name": namecontroller.text.toString(),
      "about": aboutcontroller.text.toString(),
    }, SetOptions(merge: true));
  }

   pickImage(source, context) async {
    await Permission.photos.request();
    await Permission.camera.request();

    var status = await Permission.photos.status;

    if (status.isGranted) {
      // request granted
      try {
        final img =
            await ImagePicker().pickImage(source: source, imageQuality: 90);

        imgpath.value = img!.path;
        const snackBar = SnackBar(
          content: Text('Photo is selected'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } catch (e) {}
    } else {
      //  request is denied
    }
  }

  uploadImage()async{
    UploadTask uploadTask =  FirebaseStorage.instance
          .ref("Profile Pics")
          .child(namecontroller.text.toString())
          .putFile(File(imgpath.value));
      TaskSnapshot taskSnapshot= await uploadTask; 
      String imglink =await taskSnapshot.ref.getDownloadURL();   
      FirebaseFirestore.instance.collection("Users").doc(currentuser!.uid).set(
        {
          "image_url":imglink
        },SetOptions(merge: true)
      ).then((value) => print("User Data uploaded"));
  }
/// just another method to upload
  // uploadImage()async{
  //   var name = basename(imgpath.value);
  //   var destination = 'images/${currentuser!.uid}/${name}';
  //   Reference ref = FirebaseStorage.instance.ref().child(destination);
  //   await ref.putFile(File(imgpath.value));
  // }
}
