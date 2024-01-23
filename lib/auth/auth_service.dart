import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  //  Instance of Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // SignIN
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseException catch(e){
      throw Exception(e.code);
    }
  }


  // SignUP

  // Sign Out

  // Errors
}