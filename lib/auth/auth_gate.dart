import 'package:chat_app/Screens/homePage.dart';
import 'package:chat_app/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){

          // user is logged in
          if(snapshot.hasData){
            return HomePage();
          }
        //  user is not logged in
          else{
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
