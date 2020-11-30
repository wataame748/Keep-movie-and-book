import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/wataa/AndroidStudioProjects/understand_firebase_app/lib/beans/Movie.dart';

class MainModel extends ChangeNotifier{
    List<Movie> movieList = [];

    void getMovieListRealTime(){
      final snapshots = FirebaseFirestore.instance.collection('movieList').snapshots();
      snapshots.listen((snapshot) {
        final docs = snapshot.docs;
        final movieList = docs.map((doc) => Movie(doc)).toList();//docとはdocumentReferenceのこと
        movieList.sort((b,a) => b.createdAt.compareTo(a.createdAt));
        this.movieList = movieList;
        notifyListeners();
      });
    }

    Future deleteMovies(Movie movie) async{
    await FirebaseFirestore.instance.collection('movieList')
    .doc(movie.documentID).delete();
    notifyListeners();
    }
}