import 'dart:ui';

import 'package:chatapp/Chat_page.dart';
import 'package:chatapp/counter_stateful.dart';
import 'package:chatapp/login_page.dart';
import 'package:chatapp/utils/Brand_color.dart';
import 'package:chatapp/widgets/Chat_bubble.dart';
import 'package:flutter/material.dart';
import 'Models/Author.dart';
import 'Models/Chat_message_entity.dart';

void main() {
  runApp(Chatapp());
}

// creating a chat app widget

class Chatapp extends StatelessWidget {
  const Chatapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Chat App",

      theme: ThemeData(
        primarySwatch: BrandColor.primaryColor
      ),
      // Chat_bubble(chat_message_entity:     Chat_Message_Entity(text: 'Helllo', id: '1234', createdAt: DateTime.now().millisecondsSinceEpoch, author: Author(username: 'Khushi'))
      //   ,alignment: Alignment.centerLeft,),
      home:Loginpage(),
      routes: {
        '/chat_page':(context)=>ChatPage()
      },
    );
  }
}
