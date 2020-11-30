import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:understand_firebase_app/model/bookmodel/update_book_model.dart';

class UpdateBook extends StatelessWidget{
  UpdateBook({
    this.book
});
  final book;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UpdateBookModel>(
      create: (_) => UpdateBookModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Edit Book',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
        body: Consumer<UpdateBookModel>(
          builder: (context, model, child) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    cursorColor: Colors.teal,
                    onChanged: (text) {
                      model.updatedtitle = text;
                    },
                    decoration: InputDecoration(
                      hintText: 'title',
                      hintStyle: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  TextField(
                    cursorColor: Colors.teal,
                    onChanged: (text) {
                      model.updatedauthor = text;
                    },
                    decoration: InputDecoration(
                      hintText: 'author',
                      hintStyle: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () async{
                      await model.updateBook(book);
                      Navigator.pop(context);
                    },
                    color: Colors.teal,
                    child: Text('Complete',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}