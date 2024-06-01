import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


FirebaseAuth auth= FirebaseAuth.instance;
FirebaseFirestore fstore = FirebaseFirestore.instance;
User? currentuser = FirebaseAuth.instance.currentUser; 

const collectionChats="chats";
// collections for storing data of messages
const collectionMessages="messages";
