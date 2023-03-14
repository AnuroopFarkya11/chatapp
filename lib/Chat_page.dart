import 'dart:convert';
import 'dart:ui';

import 'package:chatapp/Models/Author.dart';
import 'package:chatapp/Models/Chat_message_entity.dart';
import 'package:chatapp/widgets/Chat_bubble.dart';
import 'package:chatapp/widgets/Chat_input.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Models/Chat_message_entity.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // List<Chat_Message_Entity> _messages = [
  //
  //   Chat_Message_Entity(
  //       text: 'Hii!',
  //       id: '1234',
  //       createdAt: DateTime
  //       .now()
  //       .millisecondsSinceEpoch, author: Author(username: 'kukku')),
  //
  //
  //   Chat_Message_Entity(text: 'Helllo', id: '1234', createdAt: DateTime.now().millisecondsSinceEpoch, author: Author(username: 'Khushi')),
  //   Chat_Message_Entity(text: 'Kesee ho!\nAlooooo loo khushi...', id: '1234', createdAt: DateTime.now().millisecondsSinceEpoch, author: Author(username: 'kukku')),
  //   Chat_Message_Entity(text: 'Allooooo Kukkku.....', id: '1234', createdAt: DateTime.now().millisecondsSinceEpoch, author: Author(username: 'Khushi')),
  //   Chat_Message_Entity(text: 'kbb baaat hoogi apni iss app pr...?', id: '1234', createdAt: DateTime.now().millisecondsSinceEpoch, author: Author(username: 'Khushi')),
  //   Chat_Message_Entity(text: 'jldddd!!', id: '1234', createdAt: DateTime.now().millisecondsSinceEpoch, author: Author(username: 'kukku')),
  //
  //
  //
  // ];

  List<Chat_Message_Entity> _messages=[];

  _loadInitialMessage() async
  {
    final response = await rootBundle.loadString('assets/mock_messages.json');

    final List<dynamic> decodedList = jsonDecode(response) as List;

    final List<Chat_Message_Entity> chatMessages = decodedList.map((listItem){
      return Chat_Message_Entity.fromJson(listItem);
    }).toList();


    setState(() {
      _messages = chatMessages;
    });

    print(chatMessages.length);
  }



  @override
  void initState() {
    // TODO: implement initState
    _loadInitialMessage();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery
        .of(context)
        .size
        .height;

    _loadInitialMessage();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 100,
          title: Text(
            'Hello Hanuman ji',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  print('CLicked!');
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return Chat_bubble(
                          chat_message_entity:_messages[index],
                          alignment: _messages[index].author.username=='pooja26'
                              ? Alignment.centerRight
                              : Alignment.centerLeft);
                    })),
            Chat_input()
          ],
        ),
      ),
    );
  }
}
