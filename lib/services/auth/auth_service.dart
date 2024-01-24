import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{

  //  Instance of Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  Instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // SignIN
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      // save userdetails if doesnt already exists
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'uid':userCredential.user!.uid,
            'email': email
          }
      );

      return userCredential;
    }
    on FirebaseException catch(e){
      throw Exception(e.code);
    }
  }


  // SignUP
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try{
      //  create user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // save userdetails in seperate document
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid':userCredential.user!.uid,
          'email': email
        }
      );
      
      
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