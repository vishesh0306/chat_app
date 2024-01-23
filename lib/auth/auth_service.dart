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
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseException catch(e){
      throw Exception(e.code);
    }
  }

  // Sign Out
  Future<void> signOut()async {
    return await _auth.signOut();
  }

  // Errors

}