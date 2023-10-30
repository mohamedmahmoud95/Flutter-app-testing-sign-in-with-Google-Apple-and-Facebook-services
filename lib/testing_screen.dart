import 'package:flutter/material.dart';
import 'package:sign_in_with_google_facebook_and_apple_test/Firebase_services/sign_in_with_facebook_service.dart';

import 'Firebase_services/sign_in_with_google_service.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              ElevatedButton(onPressed: (){
               // signInWithGoogle();
                getGoogleUserData();
              },
                  child: Text("Sign in with Google")),

              ElevatedButton(onPressed: (){
                // signInWithGoogle();
                getFacebookUserData();
              },
                  child: Text("Sign in with Facebook")),

              ElevatedButton(onPressed: (){
                // signInWithGoogle();
               // getUserData();
              },
                  child: Text("Sign in with Apple")),

            ],
          ),
        ),
      ),
    );
  }
}
