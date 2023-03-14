import 'package:chatapp/Models/Chat_message_entity.dart';
import 'package:flutter/material.dart';

class Chat_bubble extends StatelessWidget {


  final Chat_Message_Entity chat_message_entity;

  final Alignment alignment;

  const Chat_bubble({Key? key, required this.chat_message_entity, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,

        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('${chat_message_entity.author.username}'),
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${chat_message_entity.text}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if(chat_message_entity.imageurl!=null)
                    Image.network(
                    '${chat_message_entity.imageurl}',
                    height: 150,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
            ),
          ],
        ),

    );
  }
}
