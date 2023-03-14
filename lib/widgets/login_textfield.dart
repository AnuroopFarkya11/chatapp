import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {Key? key,
      required this.textEditingController,
      required this.label_name,
      required this.iconn,
      required this.hasAsterisk})
      : super(key: key);

  final TextEditingController textEditingController;
  final String label_name;
  final Icon iconn;
  final bool hasAsterisk;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hasAsterisk,
      decoration: InputDecoration(
          labelText: label_name,
          prefixIcon: iconn,
          border: OutlineInputBorder()),
    );
  }
}
