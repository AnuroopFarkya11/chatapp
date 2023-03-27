import 'package:chatapp/Models/Chat_message_entity.dart';
import 'package:chatapp/serices/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chat_bubble extends StatelessWidget {
  final Chat_Message_Entity chat_message_entity;

  final Alignment alignment;

  const Chat_bubble(
      {Key? key, required this.chat_message_entity, required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAuthor = chat_message_entity.author.username == context.read<Auth_Service>().getUser();

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
            width: MediaQuery.of(context).size.width * 0.5,
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
                if (chat_message_entity.imageurl != null)
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(

                      image: DecorationImage(image: NetworkImage(chat_message_entity.imageurl!)),
                      borderRadius: BorderRadius.circular(20)
                    ),

                  )
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: isAuthor ? Theme.of(context).primaryColor : Colors.grey,
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
