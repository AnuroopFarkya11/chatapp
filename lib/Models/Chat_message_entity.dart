import 'Author.dart';

class Chat_Message_Entity {
  String text;
  String? imageurl;
  String id;
  int createdAt;
  Author author;

  Chat_Message_Entity(
      {required this.text,
      required this.id,
      required this.createdAt,
      required this.author,
      this.imageurl});

  factory Chat_Message_Entity.fromJson(Map<String, dynamic> json) {
    return Chat_Message_Entity(
        text: json['text'],
        id: json['id'],
        createdAt: json['createAt'],
        imageurl: json['image'],
        author: Author.fromJson(json['author']));
  }
}
