import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone_with_getx/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
  }

  login() async {
    print("===============================>");

    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print("=======================>after");
    if (googleUser != null) {
      print("user is not null===========");
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      UserCredential userCredential =
          await auth.signInWithCredential(authCredential);

      User? user = userCredential.user!;
      userCollection.doc(user.uid).set({
        "username": userCredential.user?.displayName,
        "profilepic": userCredential.user?.photoURL,
        "email": userCredential.user?.email,
        "uid": userCredential.user?.uid,
        "usercreated": DateTime.now()
      });
    }
  }
}
