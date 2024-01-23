import 'package:chat_app/Screens/settings_page.dart';
import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home"),),),
      drawer: MyDrawer(),
      body: Center(child: Text("HomePage it is"),),
    );
  }
}


