import 'package:flutter/material.dart';

class TitleWithSearchBox extends StatelessWidget{
  const TitleWithSearchBox({
    this.text
  });
     final String text;

  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.all(20),
     child: Row(
       children: [
         TitleWithCustomUnderline(text: text,),
         Spacer(),
         Expanded(//ExpandedがあるおかげでTextFieldが表示できる
           child: TextField(
             cursorColor: Colors.teal,
             onChanged: (value) {},
            decoration: InputDecoration(
             hintText: 'Search',
             hintStyle: TextStyle(
              color: Colors.teal
                   ),
                 ),
               ),
         ),
         Icon(Icons.search,
           color: Colors.teal,
         ),
         ],
       ),
   );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 5,
                right: 3,
            ),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: 0),
              height: 7,
              color: Colors.teal.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}