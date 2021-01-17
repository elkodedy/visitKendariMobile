import 'package:flutter/material.dart';

class MyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 500,
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
              Colors.grey[800],
              Colors.black,
            ])),
        child: new Row(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // bagian pertanyaan
                new Text("Kirim Pertanyaan Ke : ",
                    style: new TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                new Padding(padding:EdgeInsets.all(10.0)),
                new Row(children: <Widget>[
                  new Icon(Icons.place, color: Colors.grey),
                  new Padding(padding: EdgeInsets.all(5)),
                  new Text("Teknik Informatika Universitas Haluoleo, \nKendari",
                      style: new TextStyle(color: Colors.grey)),
                ]),
                new Padding(padding:EdgeInsets.all(5.0)),
                new Row(children: <Widget>[
                  new Icon(Icons.call, color: Colors.grey),
                  new Padding(padding: EdgeInsets.all(5)),
                  new Text("+62 82271362624",
                      style: new TextStyle(color: Colors.grey)),
                ]),
                new Padding(padding:EdgeInsets.all(5.0)),
                new Row(children: <Widget>[
                  new Icon(Icons.email, color: Colors.grey),
                  new Padding(padding: EdgeInsets.all(5)),
                  new Text("elkodedypratama@gmail.com",
                      style: new TextStyle(color: Colors.grey)),
                ]),
                new Padding(padding:EdgeInsets.all(25.0)),

                // bagian developer
                new Text("Dikembangkan Oleh : ",
                    style: new TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                new Padding(padding:EdgeInsets.all(10.0)),
                new Row(children: <Widget>[
                  new Icon(Icons.developer_mode, color: Colors.grey),
                  new Padding(padding: EdgeInsets.all(5)),
                  new Text("Elko Dedy Pratama",
                      style: new TextStyle(color: Colors.grey)),
                ]),
                new Padding(padding:EdgeInsets.all(5.0)),
                new Row(children: <Widget>[
                  new Icon(Icons.fiber_pin, color: Colors.grey),
                  new Padding(padding: EdgeInsets.all(5)),
                  new Text("E1E117029",
                      style: new TextStyle(color: Colors.grey)),
                ]),
                new Padding(padding:EdgeInsets.all(25.0)),

                // bagian emoticon
                new Text("Respon Anda : ",
                    style: new TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                  new Padding(padding: EdgeInsets.all(10)),
                new Row(children: <Widget>[
                  new Icon(Icons.sentiment_very_dissatisfied,
                      color: Colors.white, size: 30),
                  new Padding(padding: EdgeInsets.all(15)),
                  new Icon(Icons.sentiment_dissatisfied,
                      color: Colors.white, size: 30),
                  new Padding(padding: EdgeInsets.all(15)),
                  new Icon(Icons.sentiment_neutral,
                      color: Colors.white, size: 30),
                  new Padding(padding: EdgeInsets.all(15)),
                  new Icon(Icons.sentiment_satisfied,
                      color: Colors.white, size: 30),
                  new Padding(padding: EdgeInsets.all(15)),
                  new Icon(Icons.sentiment_very_satisfied,
                      color: Colors.white, size: 30),
                ]),
                new Padding(padding: EdgeInsets.all(15)),

                // bagian copyright
                new Text("Copyright © 2020 All rights reserved | this app \nis made by elko dedy pratama ",
                    style: new TextStyle(color: Colors.grey))
              ],
            )
          ],
        ));
  }
}
