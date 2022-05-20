import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:illuminative/models/message.dart';

import '../utils/attendance_notifier.dart';

class ChatRoomPage extends StatelessWidget {
  final dummyMessages = [
    Message(
      content: 'poruka1',
      sender: 'Dominik',
    ),
    Message(
      content: 'poruka2',
      sender: 'Netko',
    ),
    Message(
      content: 'poruka3',
      sender: 'Dominik',
    ),
    Message(
      content: 'poruka1',
      sender: 'Netko',
    ),
    Message(
      content: 'poruka3',
      sender: 'Dominik',
    ),
  ];

  final messageController = TextEditingController();
  final String username;
  ChatRoomPage({
    Key? key,
    required this.username,
  }) : super(key: key) {
    AttendanceNotifier.checkIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat room'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final message = dummyMessages[index];
                      final isMe = message.sender == username;
                      final messageColor =
                          isMe ? Theme.of(context).primaryColor : Colors.cyan;
                      return Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(message.sender),
                          ),
                          BubbleSpecialThree(
                            text: message.content,
                            color: messageColor,
                            tail: false,
                            isSender: isMe,
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      );
                    },
                    itemCount: dummyMessages.length,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: new InputDecoration(
                        hintText: 'Type in a message...',
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    child: InkWell(
                      onTap: () {
                        final message = messageController.text;
                        print(message);
                      },
                      child: Icon(
                        Icons.send,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    width: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
