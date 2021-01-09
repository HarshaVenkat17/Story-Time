import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:story_time/constants.dart';
import 'package:story_time/screens/story_screen.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int itemCount = 5;
  int chosen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stories')),
      body: itemCount > 0
          ? ListView.builder(
              itemCount: itemCount,
              //reverse: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      'Week ${index + 1}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.amber[700]),
                    ),
                    onTap: () => {Navigator.pushNamed(context, StoryScreen.id)},
                  ),
                  elevation: 2.00,
                );
              },
            )
          : Center(child: const Text('No items')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => setState(() {
          itemCount++;
        }),
      ),
    );
  }
}
