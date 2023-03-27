import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:chatapp/Models/model_image.dart';
import 'package:chatapp/repository/image_repository.dart';
import 'package:chatapp/serices/Auth_Service.dart';
import 'package:http/http.dart' as http;
import 'package:chatapp/Models/Author.dart';
import 'package:chatapp/Models/Chat_message_entity.dart';
import 'package:chatapp/widgets/Chat_bubble.dart';
import 'package:chatapp/widgets/Chat_input.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Models/Chat_message_entity.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {



  late TextEditingController chatTextController;
  
  Image_Repository image_repository = Image_Repository();


  List<Chat_Message_Entity> _messages=[];

  onMessageSent(Chat_Message_Entity message)
  {
    print(message.text);
    _messages.add(message);

    setState(() {
      print(_messages.length);

    });

  }



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

  }



  @override
  void initState() {
    // TODO: implement initState
    _loadInitialMessage();
    // image_repository.getNetwokImages();
    super.initState();

    chatTextController = TextEditingController();
    getUserName(context);
  }

  String? username;

  Future<void> getUserName(BuildContext context) async{

    username = await context.read<Auth_Service>().getUser();
  }
  @override
  Widget build(BuildContext context) {



    print("Hello ${username}" );


    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 100,
          title: Text(

            "Hello ${username}",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  context.read<Auth_Service>().logoutUser();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: [



          //
          //   FutureBuilder(
          //   future: Image_Repository().getNetwokImages(),
          //
          // builder: (context,AsyncSnapshot <List<PixelfordImage>>snapshot){
          //   if(snapshot.hasData)
          //   {
          //     return Image.network(snapshot.data![0].urlSmallSize);
          //   }
          //   return CircularProgressIndicator();
          // }),
            
            Expanded(

                child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return Chat_bubble(
                          chat_message_entity:_messages[index],
                          alignment: _messages[index].author.username== context.read<Auth_Service>().getUser()
                              ? Alignment.centerRight
                              : Alignment.centerLeft);
                    })),

            Chat_input(onSubmit: onMessageSent,textEditingController: chatTextController,)
          ],
        ),
      );

  }
}
