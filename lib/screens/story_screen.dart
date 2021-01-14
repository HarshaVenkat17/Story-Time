import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoryScreen extends StatefulWidget {
  StoryScreen({this.image});
  static String id = 'story';
  final String image;
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final titleTextController = TextEditingController();
  final storyTextController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String title,story;
  bool isSubmitted = false;
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
                  height: MediaQuery.of(context).size.height*0.35,
                  width: MediaQuery.of(context).size.width*0.95,
                  child: Image(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: TextField(
                    enabled: !isSubmitted,
                    decoration: const InputDecoration(
                      hintText: 'The Un Named...',
                      labelText: 'Name Your Story',
                    ),
                    autofocus: true,
                    style: TextStyle(fontSize: 18),
                    maxLines: 1,
                    controller: titleTextController,
                    onChanged: (value) {
                      title = value;
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: TextField(
                    enabled: !isSubmitted,
                    decoration: const InputDecoration(
                      hintText: 'Once upon a time...:',
                      labelText: 'Type your story here',
                    ),
                    autofocus: true,
                    style: TextStyle(fontSize: 18),
                    maxLines: null,
                    controller: storyTextController,
                    onChanged: (value) {
                      story = value;
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(height: 30),
                IconButton(
                    color: Colors.blue,
                    icon: Icon(Icons.send),
                    onPressed: (){
                      if(!isSubmitted){
                        _firestore.collection('Submissions').add({
                          'User': 'Ravi',
                          'Title': 'The Medallion',
                          'Story': 'There was a Medallion'
                        });
                        titleTextController.clear();
                        storyTextController.clear();
                        setState(() {
                          isSubmitted = true;
                        });
                      }
                        }),
                Visibility(
                  visible: isSubmitted,
                  child: Center(
                    child: Text(
                      'Submitted',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
