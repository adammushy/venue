import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:venue/database/DatabaseManager.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createNewUser(String name, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user!;
      await DatabaseManager().createUserData(name, email, user.uid);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  Future loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
          
      // await DatabaseManager().createUserData(name, email, user.uid);
      print(userCredential);

      return userCredential;
    } catch (e) {
      print(e.toString());
    }
  }

  Future logoutUser() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

   Future<Map<String, dynamic>> fetchUserData(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('profileList')
        .doc(uid)
        .get();

    if (snapshot.exists) {
      // User data found in the database
      return snapshot.data()!;
    } else {
      print("user data was not found");
      // User data not found
      return {};
    }
  }
}
