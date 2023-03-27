import 'dart:developer';

import 'package:chatapp/Models/Author.dart';
import 'package:chatapp/Models/Chat_message_entity.dart';
import 'package:chatapp/serices/Auth_Service.dart';
import 'package:chatapp/widgets/pickerBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chat_input extends StatefulWidget {
  final Function(Chat_Message_Entity) onSubmit;
  TextEditingController textEditingController;

  Chat_input({Key? key,required this.onSubmit,required this.textEditingController}) : super(key: key);

  @override
  State<Chat_input> createState() => _Chat_inputState();
}

class _Chat_inputState extends State<Chat_input> {
  String _imageUrl="";

  void ImagePicked(String newImage)
  {
    setState(() {
      _imageUrl = newImage;
    });
    Navigator.of(context).pop();
    log("URL : ${newImage} ");
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(_imageUrl.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(_imageUrl,height: 50,),
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {

                    showModalBottomSheet(context: context, builder: (context){
                      return NetworkImagePickerBody(imagePicked: ImagePicked,);
                    });


                  }, icon: Icon(Icons.add, color: Colors.white)),
              Expanded(
                  child: TextField(
                cursorColor: Colors.white,
                controller: widget.textEditingController,
                // keyboardType: TextInputType.text,
                minLines: 1,
                maxLines: 5,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type your message',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.w400)),
              )
              ),
              IconButton(
                  onPressed: () {
                    onMessageSent();
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ))
            ],
          ),


        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
    );
  }

  Future<void> onMessageSent() async{

    String? userNameFromCache = await context.read<Auth_Service>().getUser();

    final newMessage = Chat_Message_Entity(
        text: widget.textEditingController.text,
        id: "123",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(username: userNameFromCache!));


    if(_imageUrl.isNotEmpty)
      newMessage.imageurl = _imageUrl;


    widget.textEditingController.clear();

    widget.onSubmit(newMessage);
    widget.textEditingController.clear();
    _imageUrl="";



  }
}
