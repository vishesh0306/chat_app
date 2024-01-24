import 'package:chat_app/Screens/login_page.dart';
import 'package:chat_app/Screens/register_page.dart';
import 'package:flutter/cupertino.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
      if(showLoginPage){
        return LoginPage(ontap: togglePages,);
      }
      else{
        return RegisterPage(ontap: togglePages,);
      }
  }
}
