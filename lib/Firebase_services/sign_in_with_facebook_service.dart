import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();
//
//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}

Future<void> getFacebookUserData() async {
  try {
    UserCredential? userCredential = await signInWithFacebook();
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
