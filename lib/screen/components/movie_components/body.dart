import 'package:flutter/material.dart';
import 'file:///C:/Users/wataa/AndroidStudioProjects/understand_firebase_app/lib/screen/components/movie_components/favorite_movie.dart';
import '../commons/title_with_search_box.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          /*crossAxisAlignment: CrossAxisAlignment.start,*/
          children: [
            TitleWithSearchBox(
              text: 'Movie',
            ),
            FavoriteMovie(),
          ],
        ),
    );
  }
}
