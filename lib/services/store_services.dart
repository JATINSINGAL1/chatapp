import 'package:chatapp/constants/firebase_const.dart';

class StoreServices {
  static getUser(String id) {
    // use stream method to get flow of data
    // and use below method to reterive for single instance
    return fstore.collection("Users").where('id', isEqualTo: id).get();
  }

  static getAllUsers() {
    return fstore.collection("Users").snapshots();
  }

  static getChatData() {
    return fstore.collection(collectionChats).snapshots();
  }

  static getChats(String chatId) {
    return fstore
        .collection(collectionChats)
        .doc(chatId)
        .collection(collectionMessages)
        .orderBy("created_on", descending: false)
        .snapshots();
  }
}
