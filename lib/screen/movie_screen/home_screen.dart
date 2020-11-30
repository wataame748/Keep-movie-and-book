import 'package:flutter/material.dart';
import 'file:///C:/Users/wataa/AndroidStudioProjects/understand_firebase_app/lib/screen/book_screen/add_book_page.dart';

import 'file:///C:/Users/wataa/AndroidStudioProjects/understand_firebase_app/lib/screen/movie_screen/add_movie_page.dart';
import 'file:///C:/Users/wataa/AndroidStudioProjects/understand_firebase_app/lib/screen/book_screen/book_list_page.dart';
import '../components/movie_components/body.dart';
import '../components/movie_components/bottom_navbar.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Favorite Movie'),
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
            ListTile(
              leading: Icon(Icons.menu_book_outlined,
              color: Colors.teal,),
              title: Text('List of books'),
              subtitle: Text('It is a list of books that you favorite.',
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
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
