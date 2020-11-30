import 'package:flutter/material.dart';
import 'package:understand_firebase_app/screen/book_screen/book_list_page.dart';
import 'package:understand_firebase_app/screen/movie_screen/add_movie_page.dart';

class BottomNavBar extends StatelessWidget{
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
            icon: Icon(Icons.video_call),
            color: Colors.white,
            iconSize: 30,
            tooltip: '映画を追加',
            onPressed: (){
              //映画を追加するページへ飛ぶ
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMovie()),
              );
            },
          ),
          SizedBox(width: 66,),
          IconButton(
            icon: Icon(Icons.menu_book),
            color: Colors.white,
            iconSize: 30,
            tooltip: '本一覧',
            onPressed: (){
              //好きな本のページへ飛ぶ
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookList()),
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