import 'package:cloud_firestore/cloud_firestore.dart';

class Book{
  Book(DocumentSnapshot doc){
    this.documentID = doc.id;
    this.image = doc.data()['image'];
    this.title = doc.data()['title'];
    this.createdAt = doc.data()['createdAt'];
    this.author = doc.data()['author'];
  }
  String image;
  String title;
  String documentID;
  String author;
  Timestamp createdAt;

}