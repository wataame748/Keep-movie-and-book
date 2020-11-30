import 'package:flutter/material.dart';
import 'file:///C:/Users/wataa/AndroidStudioProjects/understand_firebase_app/lib/screen/movie_screen/home_screen.dart';

class TopScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/topimage2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
          ),
           Positioned(
             top: 140,
             left: 50,
             child: Column(
               children: [
                 Text('Movie Diary',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 50,
                   fontWeight: FontWeight.w100,
                 ),
                 ),
                 Container(
                   padding: EdgeInsets.only(left: 0),
                     child: Text('~Keep your favorite movie~',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                     ),
                     ),
                 ),
                 SizedBox(height: 50,),
                 Row(
                   children: [
                     SizedBox(width: 200,),
                     RaisedButton(
                       color: Colors.black,
                       child: Text('Begin now!',
                         style: TextStyle(
                           fontWeight: FontWeight.w400,
                             color: Colors.white
                         ),
                       ),
                       onPressed: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => HomeScreen()),
                         );
                       },
                     ),
                   ],
                 ),
               ],
             ),
           ),

        ],
      ),
    );
  }
}