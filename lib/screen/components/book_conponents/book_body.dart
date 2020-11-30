import 'package:flutter/material.dart';
import 'package:understand_firebase_app/screen/components/book_conponents/favorite_book.dart';
import 'package:understand_firebase_app/screen/components/commons/title_with_search_box.dart';

class BookBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWithSearchBox(
          text: 'Books',
        ),
        FavoriteBook(),
      ],
    );
  }
}