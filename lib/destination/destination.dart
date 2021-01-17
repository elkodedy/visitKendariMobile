import 'package:flutter/material.dart';
import 'package:elkodedy_final/myColors.dart';

import './../footer.dart';
import './detail.dart';

class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  final GlobalKey<ScaffoldState> _myHome = new GlobalKey<ScaffoldState>();

  final List<String> gambar = [
    "senja1.jpg",
    "moramo1.jpg",
    "hari1.jpg",
  ];
  final List<String> quote = [
    "TRAVELING MAKES YOU LIVE LONGER",
    "EXPLORE OUR WORLD",
    "PEACE WITH NATURE",
  ];

  // insialisasi grid hero
  List<Container> daftarDestinasi = new List();

  var destinasi = [
    {
      "nama": "Pulau Bokori",
      "gambar": "gbokori2.jpg",
      "kategori": "Sun, Beach, Sand, Sea"
    },
    {
      "nama": "Senja Bokori",
      "gambar": "gbokori1.jpg",
      "kategori": "Sun, Beach, Sand, Sea"
    },
    {
      "nama": "Pulau Labengki",
      "gambar": "glabengki3.jpg",
      "kategori": "Nature, Culture, Fish, Dive"
    },
    {
      "nama": "Penginapan Labengki",
      "gambar": "glabengki2.jpg",
      "kategori": "Nature, Culture, Fish, Dive"
    },
    {
      "nama": "Dermaga Labengki",
      "gambar": "glabengki1.jpg",
      "kategori": "SNature, Culture, Fish, Dive"
    },
    {
      "nama": "Gerbang Bungkutoko",
      "gambar": "gbungkutoko1.jpg",
      "kategori": "Jungle, Photoshoot, Nature, Adventure"
    },
    {
      "nama": "Jembatan Bungkutoko",
      "gambar": "gbungkutoko2.jpg",
      "kategori": "Jungle, Photoshoot, Nature, Adventure"
    },
    {
      "nama": "Villa Bungkutoko",
      "gambar": "gbungkutoko3.jpg",
      "kategori": "Jungle, Photoshoot, Nature, Adventure"
    },
    {
      "nama": "Danau Biru",
      "gambar": "gdanaubiru1.jpg",
      "kategori": "Jungle, Nature, Lake, Swimming"
    },
    {
      "nama": "Pulau Hari",
      "gambar": "ghari1.jpg",
      "kategori": "Sun, Beach, Sand, Sea"
    },
    {
      "nama": "Air Terjun Moramo",
      "gambar": "gmoramo1.jpg",
      "kategori": "Jungle, Photoshoot, Nature, Adventure"
    },
    {
      "nama": "Kepulauan Senja",
      "gambar": "gsenja1.jpg",
      "kategori": "Isles, Sea, Sand, Sun"
    },
    {
      "nama": "Pantai Toronipa",
      "gambar": "gtoronipa1.jpg",
      "kategori": "Sun, Beach, Sand, Sea"
    },
    {
      "nama": "Pantai Nambo",
      "gambar": "gnambo1.png",
      "kategori": "Sun, Beach, Sand, Sea"
    },
  ];

  _buatlist() async {
    for (var i = 0; i < destinasi.length; i++) {
      final destinasinya = destinasi[i];
      final String gambar = destinasinya["gambar"];
      final String kategori = destinasinya["kategori"];

      daftarDestinasi.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(children: <Widget>[
            new Flexible(
                child: new Card(
              child: new Column(
                children: <Widget>[
                  new Hero(
                    tag: destinasinya['nama'],
                    child: new Material(
                      child: new InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Detail(
                              nama: destinasinya['nama'],
                              gambar: gambar,
                              kategori: kategori),
                        )),
                        child: new Image.asset("assets/img/$gambar",
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(10.0),
                  ),
                  new Text(
                    destinasinya['nama'],
                    style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
          ])));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _myHome,
        appBar: AppBar(
          title: new Text("KENDARI DESTINATIONS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
            backgroundColor: MyColors.warnaTema,
        ),
        body: new ListView(children: [
          Column(
            children: <Widget>[
              // bagian Page View
              new Container(
                height: 200,
                child: new PageView.builder(
                  controller: new PageController(viewportFraction: 1),
                  itemCount: gambar.length,
                  itemBuilder: (BuildContext context, int i) {
                    return new Padding(
                      padding: new EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 0.0),
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
                                  child: new Image.asset(
                                      "assets/img/${gambar[i]}",
                                      fit: BoxFit.cover),
                                ))),
                            new Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.0, vertical: 15)),
                                  new Text(
                                    "Tour Destination",
                                    style: new TextStyle(
                                        color: MyColors.warnaTema,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 60,
                                        fontFamily: 'Poppins'),
                                    textAlign: TextAlign.center,
                                  ),
                                  new Text(
                                    "${quote[i]}",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),

              // bagian list view
              new Container(
                child: new GridView.count(
                  crossAxisCount: 2,
                  children: daftarDestinasi,
                  physics: ScrollPhysics(), //
                  shrinkWrap: true,
                ),
              ),


              new Container(
                  padding: EdgeInsets.all(15.0),
                  child: new Text(
                    "                               ",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.wavy,),
                  )),

              // bagian footer
              new MyFooter(),
            ],
          )
        ]));
  }
}
