
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser;
  UserCredential userCredential;
  try {
    // Trigger the authentication flow
    googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;
    debugPrint(googleUser!.displayName);
    debugPrint(googleUser.email);
    debugPrint(googleUser.photoUrl);

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );

    userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // Once signed in, return the UserCredential
    return userCredential;
  }
  catch(e){
    debugPrint(e.toString());
    return null;
  }
}

Future<void> getUserData() async {
  try {
    UserCredential? userCredential = await signInWithGoogle();
    User? user = userCredential!.user;

    if (user != null) {
      String email = user.email ?? "";
      String name= user.displayName??"";
      String phoneNumber = user.phoneNumber ??"";
      String profilePicture = user.photoURL ?? "";
      String uid = user.uid;
      Future<String?> token = user.getIdToken();

      debugPrint("Printing userData:");
      debugPrint("User display name: $name");
      debugPrint("User display name: $phoneNumber");
      debugPrint("User Email: $email");
      debugPrint("Profile Picture URL: $profilePicture");
      debugPrint("uid: $uid");
      debugPrint("token: $token");


    }
  } catch (e) {
    debugPrint("Error getting user data: $e");
  }
}