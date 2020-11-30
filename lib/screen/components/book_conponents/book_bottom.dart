import 'package:flutter/material.dart';
import 'package:understand_firebase_app/screen/book_screen/add_book_page.dart';
import 'package:understand_firebase_app/screen/movie_screen/home_screen.dart';

class BookBottomNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 66,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.teal,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.post_add),
            color: Colors.white,
            iconSize: 30,
            tooltip: '本を追加',
            onPressed: (){
              //本を追加するページへ飛ぶ
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBook()),
              );
            },
          ),
          SizedBox(width: 66,),
          IconButton(
            icon: Icon(Icons.videocam),
            color: Colors.white,
            iconSize: 30,
            tooltip: '映画一覧',
            onPressed: (){
              //好きな本のページへ飛ぶ
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          SizedBox(width: 66,),
          IconButton(
            icon: Icon(Icons.accessibility_new),
            color: Colors.white,
            iconSize: 30,
            tooltip: 'ユーザー情報',
            onPressed: (){
              //ユーザー編集ページへ飛ぶ
            },
          ),
        ],
      ),
    );
  }
}