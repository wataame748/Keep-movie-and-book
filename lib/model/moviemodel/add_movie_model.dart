import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; 
import 'package:firebase_storage/firebase_storage.dart';

class AddMovieModel extends ChangeNotifier{

  String title = '';
  Timestamp createdAt;
  File imageFile;

  CollectionReference movies = FirebaseFirestore.instance.collection('movieList');
  Future addMovie() async {
    final image = await _uploadImage();
  await movies.add({
    'title': title,
    'image': image,
    'createdAt': Timestamp.now(),
  });
  notifyListeners();
  }

  setImage(File imageFile){
    this.imageFile = imageFile;
    notifyListeners();
  }

  Future<String> _uploadImage() async{
    //storageにアップデート
    if(imageFile == null){return '';}
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('images/').child(title);
    final snapshot = await ref.putFile(imageFile);
    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}