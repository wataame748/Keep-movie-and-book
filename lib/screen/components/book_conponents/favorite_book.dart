import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:understand_firebase_app/model/bookmodel/book_main_model.dart';
import 'package:understand_firebase_app/screen/book_screen/update_book_page.dart';

class FavoriteBook extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider<BookMainModel>(
        create: (_) => BookMainModel()..getBookRealTime(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: 350,
            height: 520,
            child: Consumer<BookMainModel>(
              builder: (context, model, child) {
                final bookList = model.bookList;
                return ListView(
                  children: bookList
                      .map((book) => FavoriteBookCard(
                    book: book,
                  )).toList()

                );
              }
            ),
          ),
        ),
      );
  }
}
 class FavoriteBookCard extends StatelessWidget{
  FavoriteBookCard({
    this.book,
 });
  final book;
  @override
   Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookMainModel>(
    create: (_) => BookMainModel(),
      child: GestureDetector(
        onTap: (){
          //画像が小さいため詳細ページを作ろうと思う
        },
          child: Consumer<BookMainModel>(
            builder: (context, model, child) {
              return Card(
                color: Colors.teal[100],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Image.network(book.image,
                      ),
                      title: Text(book.title),
                      subtitle: Text(book.author),
                          ),
                  Row(
                        children: [
                        SizedBox(width: 220,),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: (){
                          //todo 編集ページへ飛ぶ
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UpdateBook(book: book,)),
                            );
                        },
                      ),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){
                          //todo 削除ページへ飛ぶ
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
                              await model.deleteBook(book);
                                //削除のAPIをたたく
                                    }
                                   ),
                                  ],
                                 );
                                },
                               );
                            },
                      ),
                    ],
                  ),
                ],
              ),
              );
            },
          ),
      ),
    );
  }
 }