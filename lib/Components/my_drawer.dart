import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/settings_page.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  void logout() async {
//    get auth service to logout
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [

              // Logo

              CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent, // This makes sure the background color of the CircleAvatar is transparent
                  child: ClipOval(
                      child: Image.asset('lib/Images/chatLogo.png',
                        fit: BoxFit.fill,height: 150,width: 220,))
              ),

              //  Home List Tile

              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                onTap: (){Navigator.pop(context);},
              ),

              //  Settings List Tile
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));
                },
              ),



            ],
          ),

          //  LogOut List Tile

          ListTile(

            title: Text("Logout",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
            trailing: Icon(Icons.logout),
            onTap: logout,
          ),

        ],
      ),
    );
  }
}