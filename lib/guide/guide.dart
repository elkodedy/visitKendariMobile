import 'package:flutter/material.dart';
import 'package:elkodedy_final/myColors.dart';
import './detailGuide.dart';

class Guide extends StatefulWidget {
  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  final List<String> gambar = [
    "pemandu1.jpg",
    "pemandu2.jpeg",
    "pemandu3.png",
    "pemandu4.jpg",
  ];
  final List<String> nama = [
    "Elko Dedy Pratama",
    "Dovier Cakrawardaya",
    "Affrilia Gita",
    "Vina Olyvia",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KENDARI GUIDERS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: MyColors.warnaTema,
        ),
        body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft,
                  colors: [
                MyColors.warnaTema,
                Colors.white,
                MyColors.warnaTema,
              ])),
          child: new PageView.builder(
            controller: new PageController(viewportFraction: 0.7),
            itemCount: gambar.length,
            itemBuilder: (BuildContext context, int i) {
              return new Padding(
                padding:
                    new EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                child: new Material(
                  borderRadius: new BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: new Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      new Hero(
                          tag: gambar[i],
                          child: new Material(
                              child: new InkWell(
                                  onTap: () => Navigator.of(context)
                                          .push(new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new DetailGuide(gambar: gambar[i], nama: nama[i]),
                                      )),
                                  child: new Image.asset(
                                      "assets/img/${gambar[i]}",
                                      fit: BoxFit.cover))))
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
