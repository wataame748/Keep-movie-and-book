import 'package:flutter/material.dart';
import 'file:///C:/Users/wataa/AndroidStudioProjects/understand_firebase_app/lib/screen/book_screen/add_book_page.dart';
import '../movie_screen/add_movie_page.dart';

import 'package:understand_firebase_app/screen/components/book_conponents/book_body.dart';

import '../components/book_conponents/book_bottom.dart';

class BookList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Books'),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu List',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.teal
              ),
            ),
            ListTile(
              leading: Icon(Icons.post_add,
                  color: Colors.teal,
              ),
                  title: Text('Add a book.'),
                  subtitle: Text('You can add a book to the list of books with a image',
              style: TextStyle(
              color: Colors.teal,
              ),
            ),
              onTap: (){
              //todo addbookページへ飛ぶ処理
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBook()),
                );
              },

            ),
            ListTile(
              leading: Icon(Icons.videocam,
                color: Colors.teal,),
              title: Text('List of movies'),
              subtitle: Text('It is a list of movies that you favorite.',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookList()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.video_call,
                color: Colors.teal,
              ),
              title: Text('Add a movie.'),
              subtitle: Text('You can add a movie to the list of movies with a image',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMovie()),
                );
              },
            ),
          ],
        ),
      ),
      body: BookBody(),
      bottomNavigationBar: BookBottomNavBar(),
    );
  }
}