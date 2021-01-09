import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class StoryScreen extends StatefulWidget {
  static String id = 'story';
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final messageTextController = TextEditingController();

  String msgText;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Image(
                    height: MediaQuery.of(context).size.height / 2.2,
                    image: AssetImage('images/logo.png'),
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Once upon a time...:',
                    labelText: 'Type your story here',
                  ),
                  autofocus: true,
                  style: TextStyle(fontSize: 18),
                  maxLines: 2,
                  controller: messageTextController,
                  onChanged: (value) {
                    msgText = value;
                  },
                  keyboardType: TextInputType.text,
                ),
                Container(height: 30),
                IconButton(
                    color: Colors.blue,
                    icon: Icon(Icons.send),
                    onPressed: () => {
                          print(msgText),
                          messageTextController.clear(),
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
