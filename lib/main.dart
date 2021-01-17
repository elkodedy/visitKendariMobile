import 'package:flutter/material.dart';
import 'dart:io';

import './detailDrawer.dart';
import './myColors.dart';
import './destination/destination.dart';
import './accomodation/accomodation.dart';
import './guide/guide.dart';
import './footer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E1E117029 TUGAS FINAL',
      theme:
          ThemeData(primarySwatch: Colors.grey, fontFamily: 'DancingScript'),
      routes: <String, WidgetBuilder>{
        '/Destination': (BuildContext context) => new Destination(),
        '/Accomodation': (BuildContext context) => new Accomodation(),
        '/Guide': (BuildContext context) => new Guide(),
        '/MyHome': (BuildContext context) => new MyHome(),
      },
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String gambar1 = "assets/img/user1.jpeg";
  String gambar2 = "assets/img/luffy.jpg";
  String backup;

  String nama1 = "Elko Dedy Pratama";
  String nama2 = "Monkey D. Luffy";
  String backupnama;

  String email1 = "elkodedy.99@gmail.com";
  String email2 = "kingofpirates@pirate.com";
  String backupemail;

  void gantiuser() {
    this.setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;

      backupnama = nama1;
      nama1 = nama2;
      nama2 = backupnama;

      backupemail = email1;
      email1 = email2;
      email2 = backupemail;
    });
  }

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      MyColors.warnaTema = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("VISIT KENDARI",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: MyColors.warnaTema,
          actions: <Widget>[
            new PopupMenuButton<Pilihan>(
                onSelected: _pilihannya,
                itemBuilder: (BuildContext context) {
                  return listPilihan.map((Pilihan x) {
                    return new PopupMenuItem<Pilihan>(
                      child: new Text(x.text),
                      value: x,
                    );
                  }).toList();
                })
          ]),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName:
                  new Text(nama1, style: new TextStyle(color: Colors.white)),
              accountEmail:
                  new Text(email1, style: new TextStyle(color: Colors.white)),
              currentAccountPicture: new GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new DetailDrawer(
                            nama: nama1,
                            gambar: gambar1,
                          )));
                },
                child: new CircleAvatar(
                  backgroundImage: new ExactAssetImage(gambar1),
                ),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new ExactAssetImage(
                        "assets/img/header2.jpg",
                      ),
                      fit: BoxFit.cover)),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                    onTap: () => gantiuser(),
                    child: new CircleAvatar(
                      backgroundImage: new ExactAssetImage(gambar2),
                    ))
              ],
            ),
            new ListTile(
              title: new Text("VISIT KENDARI",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () => Navigator.of(context).pop(),
            ),
            new ListTile(
                title: new Text(
                  "Home",
                ),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            new ListTile(
                title: new Text("Destination"),
                trailing: new Icon(Icons.filter_hdr),
                onTap: () {
                  Navigator.pushNamed(context, "/Destination");
                }),
            new ListTile(
                title: new Text("Accomodation"),
                trailing: new Icon(Icons.business),
                onTap: () {
                  Navigator.pushNamed(context, "/Accomodation");
                }),
            new ListTile(
                title: new Text("Guide"),
                trailing: new Icon(Icons.person_pin),
                onTap: () {
                  Navigator.pushNamed(context, "/Guide");
                }),
            new ListTile(
              trailing: new Icon(Icons.close),
              title: new Text("Close"),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              // bagian Page View
              new MyPageView(),

              // bagian Daftar Object Wisata
              new MyWisata(
                  gambar: "assets/img/bungkutoko1.jpg",
                  judul: "Tracking Mangrove Bungkutoko",
                  text: "Jungle, Photoshoot, Nature, Adventure"),
              new MyWisata(
                  gambar: "assets/img/labengki2.jpg",
                  judul: "Taman Nasional Labengki",
                  text: "Nature, Culture, Fish, Dive"),
              new MyWisata(
                  gambar: "assets/img/bokori2.jpg",
                  judul: "Pulau Eksotis Bokori",
                  text: "Sun, Beach, Sand, Sea"),
              new MyWisata(
                  gambar: "assets/img/senja1.jpg",
                  judul: "Kepulauan Senja",
                  text: "Isles, Sea, Sand, Sun"),
              new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15)),

              // bagian About Kendari
              new AboutKendari(),

              // bagian Comment
              new MyComment(),

              // bagian Footer
              new MyFooter(),
            ],
          ),
        ],
      ),
    );
  }
}

// bagian Page View
class MyPageView extends StatelessWidget {
  final List<String> gambar = [
    "bokori1.jpg",
    "labengki1.jpg",
    "labengki3.jpg",
  ];
  final List<String> quote = [
    "Best City Of Indonesia",
    "Your Trip Your Adventure",
    "Culture & Nature",
  ];
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 500,
      child: new PageView.builder(
        controller: new PageController(viewportFraction: 1),
        itemCount: gambar.length,
        itemBuilder: (BuildContext context, int i) {
          return new Padding(
            padding: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
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
                        child: new Image.asset("assets/img/${gambar[i]}",
                            fit: BoxFit.cover),
                      ))),
                  new Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 100)),
                        new Text(
                          "Kendari",
                          style: new TextStyle(
                              color: MyColors.warnaTema,
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
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
    );
  }
}

// class Daftar Object Wisata
class MyWisata extends StatelessWidget {
  MyWisata({this.gambar, this.judul, this.text});

  final String gambar;
  final String judul;
  final String text;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20)),
        new Center(
          child: new ClipOval(
            child: new SizedBox(
                width: 150,
                height: 150,
                child: new Material(
                  child: new InkWell(
                      onTap: () => Navigator.pushNamed(context, "/Destination"),
                      child: new Image.asset(
                        gambar,
                        fit: BoxFit.cover,
                      )),
                )),
          ),
        ),
        new Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5)),
        new Text(judul,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        new Text(text, style: new TextStyle(fontSize: 15)),
      ],
    ));
  }
}

// class about kendari
class AboutKendari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: new Column(
          children: <Widget>[
            new Row(children: <Widget>[
              new Expanded(
                  child: new Column(
                children: <Widget>[
                  new Container(
                    height: 450,
                    child: new Image.asset("assets/img/senja1.jpg",
                        fit: BoxFit.cover),
                  ),
                  new Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 30)),
                ],
              )),
              new Expanded(
                  child: new Column(
                children: <Widget>[
                  new Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 15)),
                  new Container(
                    height: 450,
                    child: new Image.asset("assets/img/bokori1.jpg",
                        fit: BoxFit.cover),
                  ),
                  new Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 15)),
                ],
              )),
              new Expanded(
                  child: new Column(
                children: <Widget>[
                  new Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 30)),
                  new Container(
                    height: 450,
                    child: new Image.asset("assets/img/toronipa1.jpg",
                        fit: BoxFit.cover),
                  ),
                ],
              )),
            ]),
            new Text(
              "about",
              style: new TextStyle(
                  color: MyColors.warnaTema,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  fontFamily: 'Poppins'),
            ),
            new Text(
              "City of Kendari",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            new Text(
              "Keindahan alam kota Kendari sudah tidak bisa kita ragukan lagi, pasalnya ada begitu banyak wisatawan menghabiskan waktu liburnya datang ke pulau ini. Untuk anda yang sedang mencari tempat wisata di Kendari, berikut ini beberapa tempat wisata yang bisa anda kunjungi bersama kami Para Guide.",
              style: new TextStyle(fontSize: 15),
            ),
            new Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15)),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        "23",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: MyColors.warnaTema,
                        ),
                      ),
                      new Text(
                        "Culture",
                        style: new TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        "1500",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: MyColors.warnaTema,
                        ),
                      ),
                      new Text(
                        "Tourist",
                        style: new TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        "34",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: MyColors.warnaTema,
                        ),
                      ),
                      new Text(
                        "Destination",
                        style: new TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15)),
            new Text(
              "Kini objek wisata di Sulawesi Tenggara semakin dilirik para wisatawan lokal maupun luar negeri.",
              style: new TextStyle(fontSize: 15),
            ),
          ],
        ));
  }
}

class MyComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Pilihan {
  const Pilihan({this.text, this.warna});
  final String text;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  const Pilihan(text: "Amber", warna: Colors.amber),
  const Pilihan(text: "Red", warna: Colors.red),
  const Pilihan(text: "Blue", warna: Colors.blue),
];
