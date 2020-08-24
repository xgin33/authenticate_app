import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String profile;

  UserModel({this.id, this.firstName, this.lastName, this.email, this.profile});

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    firstName = documentSnapshot.get("firstName");
    lastName = documentSnapshot.get("lastName");
    email = documentSnapshot.get("email");
    email = documentSnapshot.get("email");
    profile = documentSnapshot.get("profile");
  }
}