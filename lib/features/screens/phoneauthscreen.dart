import 'package:chatapp/features/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Let's Connect",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                // controller: ,
                decoration: InputDecoration(
                  
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    labelText: "Phone Number",
                    prefixText: "+91",
                    hintText: " 85246546798",
                    prefixIcon: const Icon(Icons.phone_android_rounded)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We will send a SMS with a confirmation code to your phone number",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Get.to(const HomeScreen(),transition: Transition.downToUp);
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
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
