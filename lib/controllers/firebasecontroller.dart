import 'package:chatapp/constants/firebase_const.dart';
import 'package:chatapp/features/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var otpController = List.generate(6, (index) => TextEditingController());

  var isOtpSent = false.obs;

  // send otp and auth variables
  String verificationID = "";

  otpSend() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException ex) {
            if (ex.code == "invalid-phone-number") {
              print("invalid ");
            }
          },
          codeSent: (String verificationId, int? resendToken) {
            verificationID = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          phoneNumber: "+91${phoneController.text}");
    } catch (e) {
      print(e.toString());
    }
  }

  // verify otp
  verifyOtp(context) async {
    // creating otp
    String otp = "";
    for (int i = 0; i < otpController.length; i++) {
      otp = otp + otpController[i].text;
    }

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp);
    final User? user = (await auth.signInWithCredential(credential)).user;

    try{
      if (user != null) {
      // storing the data into database
      //setting doc reference here
      DocumentReference store = fstore.collection("Users").doc(user.uid);
      await store.set(
        {
        "id": user.uid,
        "name": usernameController.text.toString(),
        "phone": phoneController.text.toString(),
      },SetOptions(merge: true)
      );
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return const SnackBar(content: Text("Logged In"));
      //   },
      // );
      print("logged in");

      Get.off(const HomeScreen(), transition: Transition.downToUp);
    }}
    catch(e){
      //   showDialog(
      //   context: context,
      //   builder: (context) {
      //     return  SnackBar(content: Text(e.toString()));
      //   },
      // );
      print(e.toString());
    }
  }
}
