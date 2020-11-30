import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  Movie(DocumentSnapshot doc){
    /*
    *A DocumentSnapshot contains data read from a document in your Cloud Firestore database.
    *
    * A DocumentReference refers to a document location in a Cloud Firestore database and can be used to write, read, or listen to the location.
    *  There may or may not exist a document at the referenced location.*/
    this.documentID = doc.id;
    this.title = doc.data()['title'];
    this.image = doc.data()['image'];
    this.createdAt = doc.data()['createdAt'];
  }
  String title;
  String image;
  Timestamp createdAt;
  String documentID;

}