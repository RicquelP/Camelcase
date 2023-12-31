import 'package:flutter/material.dart';


class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        color: Colors.black,
        fontSize: 20.0,
      ),
    );
  }
}