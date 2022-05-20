import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';
import '../utils/attendance_notifier.dart';
import '../widgets/message_tile.dart';

class ChatRoomPage extends StatelessWidget {
  final String username;
  final messageController = TextEditingController();

  ChatRoomPage(this.username, {Key? key}) : super(key: key) {
    AttendanceNotifier.checkIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Room'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .orderBy('timestamp')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) return Container();
                  final messages = snapshot.data!.docs
                      .map(
                        (message) => Message(
                          content: message['content'],
                          sender: message['sender'],
                        ),
                      )
                      .toList();
                  return ListView.builder(
                    itemBuilder: (_, index) => MessageTile(
                      isSender: messages[index].sender == username,
                      message: messages[index],
                    ),
                    itemCount: messages.length,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type in a message...',
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    child: IconButton(
                      onPressed: () {
                        final content = messageController.text;
                        final message =
                            Message(content: content, sender: username);
                        messageController.clear();
                        FirebaseFirestore.instance
                            .collection('messages')
                            .add(message.toJson());
                      },
                      icon: Icon(
                        Icons.send,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    width: 60,
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
