import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:illuminative/pages/enter_name_page.dart';

import 'pages/chat_room_page.dart';
import 'utils/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Illuminative Workshop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ChatRoomPage(
        username: 'Dominik',
      ),
    );
  }
}
