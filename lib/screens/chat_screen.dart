import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:story_time/constants.dart';
import 'package:story_time/screens/story_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int itemCount = 5;
  int chosen;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stories')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('Stories').snapshots(),
        builder: (context,snapshot){
          List<Widget> temp = [];
          if(snapshot.hasData){
            final stories = snapshot.data.docs;
            int i = stories.length;
            for (var story in stories){
              final image = story['image'];
              temp.add(StoryView(index: i,image: image,));
              i = i-1;
            }
          }
          return ListView(
            children: temp,
          );
        },
      )
    );
  }
}


class StoryView extends StatelessWidget {
  StoryView({this.index, this.image});
  final int index;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Week $index',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.amber[700]),
        ),
        onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryScreen(image: image,)))},
      ),
      elevation: 2.00,
    );
  }
}



//itemCount > 0
//? ListView.builder(
//itemCount: itemCount,
////reverse: true,
//itemBuilder: (BuildContext context, int index) {
//return Card(
//child: ListTile(
//title: Text(
//'Week ${index + 1}',
//textAlign: TextAlign.center,
//style: TextStyle(
//fontWeight: FontWeight.bold,
//fontSize: 25.0,
//color: Colors.amber[700]),
//),
//onTap: () => {Navigator.pushNamed(context, StoryScreen.id)},
//),
//elevation: 2.00,
//);
//},
//)
//: Center(child: const Text('No items')),
//floatingActionButton: FloatingActionButton(
//backgroundColor: Colors.blue,
//onPressed: () => setState(() {
//itemCount++;
//}),
//),