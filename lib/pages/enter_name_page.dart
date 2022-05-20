import 'package:flutter/material.dart';
import 'package:illuminative/pages/chat_room_page.dart';

class EnterNamePage extends StatelessWidget {
  final usernameController = TextEditingController();

  EnterNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Greatest Chat App ever',
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 300,
              child: TextField(
                controller: usernameController,
                decoration: new InputDecoration(
                  hintText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                final username = usernameController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoomPage(
                      username: username,
                    ),
                  ),
                );
                print('Bok ${username}');
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  'Go to chat room',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
