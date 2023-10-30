import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            ElevatedButton(onPressed: (){
             // signInWithGoogle();
              getUserData();
            },
                child: Text("Sign in with Google")),

          ],
        ),
      ),
    );
  }
}
