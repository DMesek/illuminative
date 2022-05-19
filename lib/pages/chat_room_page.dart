import 'package:flutter/material.dart';

import '../utils/attendance_notifier.dart';

class ChatRoomPage extends StatelessWidget {
  ChatRoomPage({Key? key}) : super(key: key) {
    AttendanceNotifier.checkIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
