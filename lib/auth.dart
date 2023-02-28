import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/Screens/explore_mySpace.dart';
import 'package:mental_health_app/Screens/login_or_register.dart';
import 'package:mental_health_app/main.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  get uid => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //user logged in
          if(snapshot.hasData){
            User? user = FirebaseAuth.instance.currentUser;
            return MyHomePage(uid:user!.uid);
          }else{
            return const Explore();
          }
        },
      ),
    );
  }
}
