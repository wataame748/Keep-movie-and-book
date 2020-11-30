
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:understand_firebase_app/model/moviemodel/main_model.dart';
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

class FavoriteMovie extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..getMovieListRealTime(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<MainModel>(
            builder: (context, model, child) {
              final movieList = model.movieList;
              return Container(
                width: 350,
                child: SizedBox(
                  height: 550,
                  child: ListView(
                    children: movieList
                      .map((movie) => FavoriteMovieCard(
                      movie: movie,
                    ),
                    ).toList(),
                  ),
                ),
              );
            }
          ),
        ),
    );
  }
}

class FavoriteMovieCard extends StatelessWidget{
  const FavoriteMovieCard({
    this.movie,
  });
   final movie;


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel(),
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 50,
        ),
        child: Consumer<MainModel>(
          builder: (context, model, child) {
            return Stack(
              children: [
                Container(
                  height: 420,
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),

                ),
                Column(
                children: [
                  Container(
                    height: 400,
                      child: Image.network(movie.image)
                  ),
                  GestureDetector(
                    onTap: (){
                      //映画詳細へ
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 280,
                            child: Text(movie.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                            ),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.black,
                            onPressed: (){
                              return showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                        title: Text("Is it OK to delete this??"),
                                        content: Text("Data will be completely deleted on this device."),
                                        actions: <Widget>[
                                          // ボタン領域
                                          FlatButton(
                                            child: Text("Cancel",
                                            style: TextStyle(
                                              color: Colors.teal,
                                            ),
                                            ),
                                            onPressed: () => Navigator.pop(context),
                                          ),
                                          FlatButton(
                                            child: Text("Sure",
                                              style: TextStyle(
                                                color: Colors.teal,
                                              ),
                                            ),
                                            onPressed: () async{
                                              Navigator.pop(context);
                                              await model.deleteMovies(movie);
                                              //削除のAPIをたたく
                                            }
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                          //日付を追加するならここに追加
                        ],
                      ),
                    ),
                  )
                ],

              ),
              ],
            );
          }
        ),
      ),
    );
  }
}
