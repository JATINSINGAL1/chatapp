import 'package:chatapp/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.black,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/icons/ic_user.png",
                    color: Colors.white,
                  ),
                  const Positioned(
                      right: 0,
                      bottom: 20,
                      child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 16,
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 20,
                          ))),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.grey,thickness: 0.5,),
            const SizedBox(height: 10,),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: TextFormField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Name",
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
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
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "About",
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    suffixIcon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              title: TextField(
                readOnly: true,
                cursorColor: Colors.white,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixText: "+91",
                  prefixStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                    labelText: "Phone",
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
