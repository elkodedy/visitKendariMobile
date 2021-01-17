import 'package:flutter/material.dart';
import 'package:elkodedy_final/footer.dart'; 
import 'package:elkodedy_final/myColors.dart';

class DetailGuide extends StatefulWidget {
  DetailGuide({this.gambar, this.nama});
  final String gambar;
  final String nama;

  @override
  _DetailGuideState createState() => _DetailGuideState();
}

class _DetailGuideState extends State<DetailGuide> {
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
      body: ListView(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                  width: 400,
                  height: 400,
                  decoration: new BoxDecoration(
                      gradient:
                          new RadialGradient(center: Alignment.center, colors: [
                    MyColors.warnaTema,
                    Colors.white.withOpacity(0.9),
                  ]))),
              new Center(
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: new Hero(
                  tag: widget.gambar,
                  child: new ClipOval(
                    child: new SizedBox(
                        width: 300,
                        height: 300,
                        child: new Material(
                          child: new InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: new Image.asset(
                                "assets/img/${widget.gambar}",
                                fit: BoxFit.cover,
                              )),
                        )),
                  ),
                ),
              ),
              ),
            ],
          ),
          new Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  new Text("${widget.nama}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  new Padding(padding: EdgeInsets.all(10)),
                  new Text(
                    "     Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \n\n     Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n     Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: new TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              )),
            new MyFooter(),
        ],
      ),
    );
  }
}
