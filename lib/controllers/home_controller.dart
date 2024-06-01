import 'package:chatapp/constants/firebase_const.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late SharedPreferences pref;
  // actually this has its own purpose of creating a globle instance and state now i can manage the state globally in entire app.
  static HomeController instance = Get.find();

  getUsersDetails() async {
    await fstore
        .collection("Users")
        .where("id", isEqualTo: currentuser!.uid)
        .get()
        .then((value) async {
      pref = await SharedPreferences.getInstance();
      // locally storing user data under user_details 
      pref.setStringList("user_details", [  
        value.docs[0]["name"],
        value.docs[0]["image_url"]
        ]);
    });
  }

  @override
  void onInit() {
    getUsersDetails();
    super.onInit();
  }
}
