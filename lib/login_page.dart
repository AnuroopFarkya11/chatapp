import 'package:chatapp/utils/spaces.dart';
import 'package:chatapp/utils/textfield_styles.dart';
import 'package:chatapp/widgets/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final userName_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
                label_name: "User Namw",
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
                onPressed: () {
                  Navigator.pushNamed(context, '/chat_page');
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
    ));
  }
}
