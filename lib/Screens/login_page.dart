import 'package:chat_app/Components/my_button.dart';
import '../services/auth/auth_service.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

import '../Components/my_TextField.dart';

class LoginPage extends StatelessWidget {

  //Email & Password TextEditingControllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  final void Function()? ontap; // ontap to go to register page

  // Login Method
  void login(BuildContext context) async{

    final authService = AuthService();  //  auth Service instance

  //  try Login
    try{
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    }
  //  catch errors
    catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      ));
    }
  }

  LoginPage({
    Key? key,
  required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          //  Logo
        
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent, // This makes sure the background color of the CircleAvatar is transparent
              child: ClipOval(
                  child: Image.asset('lib/Images/chatLogo.png',
                    fit: BoxFit.fill,height: 150,width: 220,))
              ),
        
        
            //  Welcome back Message
            Center(child: Text("Welcome to Doston ki Duniya",
            style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.primary),
            ),),
            Center(child: Text("(Your Apna Chat Room)",
              style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.primary),
            )),
        
          //  Email Text Field
            MyTextField(hintText: 'Email',obsecureText: false,controller: _emailController,),
        
          //  Password Text Field
          MyTextField(hintText: 'Password',obsecureText: true,controller: _passwordController,),
        
            SizedBox(height: 20,),
        
        
          //  Login Button
            MyButton(text: "Login", ontap: ()=> login(context)),
        
            SizedBox(height: 10,),
        
          //  not registered, Register Now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: ontap,
                    child: Text("Register Now",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
