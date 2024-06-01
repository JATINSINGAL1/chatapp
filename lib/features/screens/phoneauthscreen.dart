import 'package:chatapp/controllers/firebasecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // this is done to initalize the controller
    var controller = Get.put(AuthenticationController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Let's Connect",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(
                height: 32,
              ),
              // IN this method we have used normal validation method for future change use form validation method
              // Username
              TextField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    labelText: "Username",
                    hintText: "Alex",
                    prefixIcon: const Icon(Icons.phone_android_rounded)),
              ),
              const SizedBox(
                height: 10,
              ),
              // Phone Number
              TextField(
                controller: controller.phoneController,
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
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              // OTP entries
              Obx(
                () => Visibility(
                  // to make widget visible only when the otp is sent
                  visible: controller.isOtpSent.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        6,
                        (index) => SizedBox(
                              width: 42,
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                controller: controller.otpController[index],
                                cursorColor: Colors.black,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                                onChanged: (value) {
                                  // this is important part of otp thing changing focus or moving the cursor to next text field
                                  if (value.length == 1 && index <= 5) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (value.isEmpty && index > 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    hintText: "*"),
                              ),
                            )),
                  ),
                ),
              ),
              // continue button
              const Spacer(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () async {
                    if (controller.usernameController.text == "" ||
                        controller.phoneController.text == "") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Enter all the fields"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'))
                            ],
                          );
                        },
                      );
                    } else {
                      if (!controller.isOtpSent.value) {
                        controller.isOtpSent.value = true;
                        await controller.otpSend();
                      } else {
                        await controller.verifyOtp(context);
                      }
                    }
                  },
                  child: const Text(
                    overflow: TextOverflow.ellipsis,
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
