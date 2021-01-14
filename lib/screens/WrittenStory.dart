import 'package:flutter/material.dart';

class WrittenStory extends StatefulWidget {
  WrittenStory({this.title,this.storyLine,this.image});
  static String id = 'write';
  final storyLine, title, image;
  @override
  _WrittenStoryState createState() => _WrittenStoryState();
}

class _WrittenStoryState extends State<WrittenStory> {
  bool dislike = false, like = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.35,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(widget.image),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04, vertical: MediaQuery.of(context).size.height*0.04),
              child: Text(
                widget.storyLine,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: "dislike",
              backgroundColor: dislike?Colors.blue:Colors.white,
              onPressed: (){
                print(dislike);
                if(dislike){
                  setState(() {
                    dislike = false;
                  });
                }
                else if(!dislike && like){
                  setState(() {
                    like = false;
                    dislike = true;
                  });
                }
                else if(!dislike){
                  setState(() {
                    dislike = true;
                  });
                }
              },
              child: Icon(
                Icons.thumb_down,
                color: dislike?Colors.white:Colors.black,
              ),
            ),
            FloatingActionButton(
              heroTag: "like",
              backgroundColor: like?Colors.blue:Colors.white,
              onPressed: (){
                if(like){
                  setState(() {
                    like = false;
                  });
                }
                else if(!like && dislike){
                  setState(() {
                    dislike = false;
                    like = true;
                  });
                }
                else if(!like){
                  setState(() {
                    like = true;
                  });
                }
              },
              child: Icon(
                  Icons.thumb_up,
                color: like?Colors.white:Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
