import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService{

//   Instance of fireStore

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//  get user Stream

    Stream<List<Map<String,dynamic>>> getUserStream(){
          return _firestore.collection("Users").snapshots().map((event)
          {
              return event.docs.map((e){
                //go through each individual user
                final user = e.data();
                //return user
                return user;
              }).toList();
          });
    }


//  get message


//  send message
}