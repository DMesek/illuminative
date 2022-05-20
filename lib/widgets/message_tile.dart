import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';

class MessageTile extends StatelessWidget {
  final bool isSender;
  final Message message;
  const MessageTile({
    required this.isSender,
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            message.sender,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 2),
        BubbleSpecialThree(
          text: message.content,
          color: isSender
              ? Theme.of(context).primaryColor
              : Color.fromARGB(255, 229, 171, 171),
          tail: false,
          isSender: isSender,
          textStyle: isSender
              ? TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )
              : TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
