import 'package:flutter/material.dart';

import '../utils/attendance_notifier.dart';

class ChatRoomPage extends StatelessWidget {
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
      appBar: AppBar(),
      body: Center(
        child: Text(username),
      ),
    );
  }
}
