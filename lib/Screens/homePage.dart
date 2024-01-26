import 'package:chat_app/Screens/chat_page.dart';
import 'package:chat_app/Screens/settings_page.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import '../Components/userTile.dart';
import '../services/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/my_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // chat and auth services instance
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home"),),),
      drawer: MyDrawer(),
      body: BuildUserList(),
    );
  }

  Widget BuildUserList() {
    return StreamBuilder(stream: _chatService.getUserStream(), builder: (context, snapshot){

    //  errors

      if(snapshot.hasError){
        return Text("Errors");
      }

    //  loading

      if(snapshot.connectionState==ConnectionState.waiting){
        return Text("Loading...");
      }

    //  return list view

      return ListView(
        children: snapshot.data!.map<Widget>((userData)=> _BuildUserListItem(userData,context)).toList()

      );

    });
  }


//  Build Individual List Item

Widget _BuildUserListItem(Map<String,dynamic> userData, BuildContext context){

    //    display All users except current user
  if(userData["email"] != _authService.getCurrentUser()!.email) {
    return UserTile(
      name: userData['email'],
      ontap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ChatPage(receiverEmail: userData['email'])
        ));
      },);
  }
  else{
    return Container();
  }
}
}





