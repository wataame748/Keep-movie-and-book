import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:understand_firebase_app/screen/top_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TopScreen(),
    );
  }
}
/*
以下はmovieListを表示する処理
ListView(
children: movieList
.map((Movie) => ListTile(
leading: Image.network(Movie.image),
title: Text(Movie.title),
),
).toList(),
);*/
