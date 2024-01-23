import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/my_TextField.dart';
import '../Components/my_button.dart';

class RegisterPage extends StatelessWidget {


  //Email & Password TextEditingControllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();


  final void Function()? ontap;   // ontap to go to Login page


  // Register Method
  void register(BuildContext context) async {
    final authService = AuthService(); //  AuthService Instance

    //  if password match -> create user
    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        authService.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      }
      catch (e) {
        showDialog(context: context, builder: (context) =>
            AlertDialog(
              title: Text(e.toString()),
            ));
      }
    }
    // if Password Does't Match -> show error box
    else {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Text("Password dont match"),
          ));
    }
  }






   RegisterPage({
     Key? key,
   required this.ontap,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        
           //  Confirm Password Text Field
            MyTextField(hintText: 'Confirm Password',obsecureText: true,controller: _confirmpasswordController,),
        
            SizedBox(height: 20,),
        
        
            //  Login Button
            MyButton(text: "Register", ontap: ()=> register(context)),
        
            SizedBox(height: 10,),
        
            //  not registered, Register Now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: ontap,
                  child: Text("Login",
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
