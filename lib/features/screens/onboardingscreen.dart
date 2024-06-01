import 'package:chatapp/constants/strings.dart';
import 'package:chatapp/features/screens/phoneauthscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/ic_logo.png",
                      width: 120,
                    ),
                    const Text(
                      "FunChat",
                      style: TextStyle(fontSize: 28, fontFamily: "mont_bold"),
                    ),
                  ],
                )),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                          listOfFeatures.length,
                          (index) => Chip(
                              shape:const StadiumBorder(),
                              backgroundColor: Colors.transparent,
                              side: BorderSide(color: Colors.grey.shade600),
                              label: Text(
                                listOfFeatures[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2,
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      slogan,
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width ,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: Colors.black,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          Get.to(const VerificationScreen(),transition: Transition.downToUp);
                        },
                        child: const Text(
                          "Start Messaging",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      poweredby,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
