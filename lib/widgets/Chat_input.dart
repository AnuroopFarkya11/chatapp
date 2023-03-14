import 'package:flutter/material.dart';

class Chat_input extends StatelessWidget {
  Chat_input({Key? key}) : super(key: key);

  final textcomtroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.add, color: Colors.white)),
          Expanded(
              child: TextField(
            cursorColor: Colors.white,

            keyboardType: TextInputType.text,
            minLines: 1,
            maxLines: 5,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your message',
                hintStyle: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.w400)),
          )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ))
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
    );
  }
}
