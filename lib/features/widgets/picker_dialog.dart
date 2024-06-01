import 'package:chatapp/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EpickerDialog extends StatelessWidget {
  const EpickerDialog({super.key, required this.controller});
  final ProfileController controller;
  @override
  Widget build(BuildContext context) {
    var listTitle = ['camera', 'gallery', 'cancel'];
    var icons = [
      Icons.camera_alt_rounded,
      Icons.photo_size_select_actual_rounded,
      Icons.cancel_rounded
    ];
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Select Source",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            ListView(
              shrinkWrap: true,
              children: List.generate(
                  3,
                  (index) => ListTile(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.back();
                              controller.pickImage(ImageSource.camera, context);
                              break;
                            case 1:
                              Get.back();
                              controller.pickImage(
                                  ImageSource.gallery, context);
                              break;
                            case 2:
                              Get.back();
                              break;
                            default:
                          }
                        },
                        leading: Icon(
                          icons[index],
                          color: Colors.white,
                        ),
                        title: Text(
                          listTitle[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
