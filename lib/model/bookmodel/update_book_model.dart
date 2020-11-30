import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:understand_firebase_app/beans/Book.dart';
class UpdateBookModel extends ChangeNotifier{
  String updatedtitle = '';
  String updatedauthor = '';
    CollectionReference books = FirebaseFirestore.instance.collection('bookList');
    Future updateBook(Book book) async{
       await books.doc(book.documentID)
          .update({
        'title': updatedtitle,
        'author': updatedauthor,
      });
       notifyListeners();
    }
}