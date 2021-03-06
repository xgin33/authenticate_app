import 'package:authenticate_app/controllers/controllers.dart';
import 'package:authenticate_app/firebase/dao/user_dao.dart';
import 'package:authenticate_app/ui/models/user.dart';
import 'package:authenticate_app/ui/views/home.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticatorController extends GetxController {
  Rx<User> _firebaseUser = Rx<User>();
  User get user => _firebaseUser.value;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());
  }

  void createUser(String firstName, String lastName, String email,
      String password, String profile) async {
    try {
      UserCredential _userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      // Create the user in database
      UserModel _user = UserModel(
          id: _userCredential.user.uid,
          firstName: firstName,
          lastName: lastName,
          email: _userCredential.user.email,
          profile: profile);
      if (await UserDao().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }
    } catch (e) {
      Get.snackbar("Error creating account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.to(Home());
    } catch (e) {
      Get.snackbar("Error sign account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _firebaseAuth.signOut();
      Get.to(Home());
    } catch (e) {
      Get.snackbar("Error signing out", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}
