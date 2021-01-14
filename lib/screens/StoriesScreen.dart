import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:story_time/screens/WrittenStory.dart';


class StoriesScreen extends StatefulWidget {
  static String id = 'chat';
  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _firestore.collection('Submissions').snapshots(),
        builder: (context,snapshot){
          List<Widget> temp = [];
          if(snapshot.hasData){
            final stories = snapshot.data.docs;
            for (var story in stories){
              final storyLine = story['Story'];
              final image = story['image'];
              final title = story['Title'];
              final userName = story['User'];
              temp.add(StoriesView(image: image, storyLine: storyLine,title: title, userName: userName,));
            }
          }
          return Container(
            child: ListView(
              children: temp,
            ),
          );
        },
      )
    );
  }
}


class StoriesView extends StatelessWidget {
  StoriesView({this.title,this.image,this.userName,this.storyLine});
  final String image, storyLine, title, userName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WrittenStory(storyLine: storyLine, title: title,image: image,)));
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xff00BCD4),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    '~by $userName',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
