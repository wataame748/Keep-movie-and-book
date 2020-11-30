import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:understand_firebase_app/model/bookmodel/add_book_model.dart';

class AddBook extends StatelessWidget{
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Your Favorite Movie'),
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model, child) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Expanded(
                child: Column(
                  children: [
                    InkWell(
                    onTap: () async{
                    final pickedFile = await picker.getImage(
                        source: ImageSource.gallery);
                    model.setImage(File(pickedFile.path));
                      },
                      child: SizedBox(
                        width: 100,
                        height: 160,
                        child: model.imageFile != null
                            ? Image.file(model.imageFile)
                            : Container(color: Colors.grey,),
                      ),
                    ),
                    TextField(
                      cursorColor: Colors.teal,
                      onChanged: (text) {
                        model.title = text;
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
                        model.author = text;
                      },
                      decoration: InputDecoration(
                        hintText: 'author',
                        hintStyle: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    RaisedButton(
                      onPressed: () async{
                        await model.addBook();
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
              ),
            );
          }
        ),
      ),
    );
  }
}