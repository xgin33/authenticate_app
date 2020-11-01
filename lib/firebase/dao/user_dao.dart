import 'package:authenticate_app/ui/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDao {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await firestore.collection("users").doc(user.id).set({
        "firstName": user.firstName,
        "lastName": user.lastName,
        "email": user.email,
        "profile": user.profile,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
