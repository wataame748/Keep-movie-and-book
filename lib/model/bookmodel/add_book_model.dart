import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier{
  File imageFile;
  String title = '';
  String author = '';
  Timestamp createdAt;

  CollectionReference books = FirebaseFirestore.instance.collection('bookList');
 Future addBook() async {
   final image =  await _uploadImage();
   await books.add({
      'image': image,
      'title': title,
      'author': author,
      'createdAt': Timestamp.now(),
   });
   notifyListeners();
 }
  setImage(File imageFile){
    this.imageFile = imageFile;
    notifyListeners();
  }

 Future<String> _uploadImage() async {
   if(imageFile == null){return '';}
   final storage = FirebaseStorage.instance;
   final ref = storage.ref().child('bookimages/').child(title);
   final snapshot = await ref.putFile(imageFile);
   final downloadURL = await snapshot.ref.getDownloadURL();
   return downloadURL;

 }
}