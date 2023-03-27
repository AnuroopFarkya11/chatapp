import 'dart:developer';

import 'package:chatapp/serices/Auth_Service.dart';
import 'package:chatapp/utils/spaces.dart';
import 'package:chatapp/utils/textfield_styles.dart';
import 'package:chatapp/widgets/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final userName_Controller = TextEditingController();

  Future<void> loginUser(BuildContext context) async{

    // context.read<Auth_Service>().loginUser(userName_Controller.text);
    String user  = userName_Controller.text;
    context.read<Auth_Service>().loginUser(user);
    Navigator.pushReplacementNamed(context, '/chat_page');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("assets/chat.png",height: 200,),
              verticalSpacing(40),
              LoginTextField(
                  hasAsterisk: false,
                  textEditingController: userName_Controller,
                  label_name: "User Name",
                  iconn: Icon(Icons.account_circle_rounded)),
              verticalSpacing(50),
              LoginTextField(
                  hasAsterisk: true,
                  textEditingController: userName_Controller,
                  label_name: "Password",
                  iconn: Icon(Icons.lock_outline_rounded)),
              verticalSpacing(
                50,
              ),
              ElevatedButton(
                  onPressed: () async{
                    await loginUser(context);
                    log("LoginField data ${userName_Controller.text}");
                  },
                  child: Text("LOGIN")),

              TextButton(onPressed: ()async{
                if(!await launch("https://www.linkedin.com/in/anuroop-farkya-4a9451213/"))
                  print("nhi hui");

              }, child: Text(
                "https://www.linkedin.com/in/anuroop-farkya-4a9451213/"
              ))
            ],
          ),
        ),
      ),
    ));
  }


}
