import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grooming_essence/Pages/HomePage.dart';
import 'package:grooming_essence/Pages/WelcomeScreen.dart';
class LoginProcessing extends StatelessWidget {

  static final String loginProcess = '/login_process';

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
            return HomePage();
          }
          else if(snapshot.hasError){
            return Center(child: Text("Something Went Wrong"),);
          }
          else{
            return WelcomeScreen();
          }
        }
    ),
  );
}