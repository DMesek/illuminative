import 'package:flutter/material.dart';
import 'package:illuminative/pages/chat_room_page.dart';

class EnterNamePage extends StatelessWidget {
  EnterNamePage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Greatest Chat App',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 400,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
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
                    builder: (context) => ChatRoomPage(username),
                  ),
                );
                print(username);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 20,
                ),
                child: Text(
                  'Go to chat room',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
