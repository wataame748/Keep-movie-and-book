import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/wataa/AndroidStudioProjects/understand_firebase_app/lib/beans/Book.dart';


class BookMainModel extends ChangeNotifier{
  List<Book> bookList = [];
   void getBookRealTime() {
     final snapshots = FirebaseFirestore.instance.collection('bookList').snapshots();
     snapshots.listen((snapshot) {
       final docs = snapshot.docs;
       final bookList = docs.map((doc) => Book(doc)).toList();
       bookList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
       this.bookList = bookList;
       notifyListeners();
     });
   }
   
   Future deleteBook(Book book) async{
     CollectionReference books = FirebaseFirestore.instance.collection('bookList');
     await books.doc(book.documentID).delete();
     notifyListeners();
   }
}
