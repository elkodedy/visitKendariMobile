import 'package:flutter/material.dart';
import 'package:elkodedy_final/myColors.dart';
import './../footer.dart';

class Hotel extends StatefulWidget {
  Hotel({this.nama, this.gambar, this.kategori});
  final String nama;
  final String gambar;
  final String kategori;

  @override
  _HotelState createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  TextEditingController controllerIn = new TextEditingController();

  String textKomen = "";
  String gambarKomen = "transparan.png";
  String namaKomen = "";
  String tanggalKomen = "";

  void _snackbar(String str) {
    if (str.isEmpty) return;

    _scaffoldState.currentState.showSnackBar(new SnackBar(
      content: new Text(str, style: new TextStyle(fontSize: 20)),
      duration: new Duration(seconds: 1),
    ));
  }

  void _alertDialog(String str) {
    if (str.isEmpty) return;

    AlertDialog alertDialog = new AlertDialog(
        content: new Text(
          str,
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          new RaisedButton(
              color: Colors.yellow,
              child: new Text("OK", style: TextStyle(fontSize: 15)),
              onPressed: () {
                Navigator.pop(context);
              })
        ]);

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldState,
        body: new ListView(children: <Widget>[
          new Container(
              child: new Hero(
            tag: widget.nama,
            child: new Material(
              child: new InkWell(
                child: new Image.asset(
                  "assets/img/${widget.gambar}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
          new BagianNama(nama: widget.nama, kategori: widget.kategori),
          new BagianIcon(),
          new Keterangan(),

          // comment
          new Container(
              padding: new EdgeInsets.all(20),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text("3 Komentar:",
                        style: new TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ])),
          new Komentars(
              gambar: "avanaruto.jpg",
              nama: "Naruto Uzumaki",
              tgl: "2 February 2020",
              komen:
                  "Jangan liat lamanya perjalanan, karena selama perjalanan kalian akan dimanjakan dengan pemandangan laut yang cantik, serta atraksi dari lumba-lumba yang akan ikut mengiringi perjalanan kita."),
          new Komentars(
              gambar: "avaluffy.jpg",
              nama: "Monkey D. Luffy",
              tgl: "15 Maret 2020",
              komen:
                  "Pemandangan indah dari pulau yang satu ini memang tak hanya terletak pada keindahan daratannya saja, tapi jangan ragukan keindahan bahwa laut yang juga dimilikinya."),
          new Komentars(
              gambar: "avazoro.jpg",
              nama: "Roronoa Zoro",
              tgl: "5 Mei 2020",
              komen:
                  "Ketika kalian melakukan snorkling maka kalian akan bisa melihat beragam biota laut yang ada di bawah perairan pulau labengki ini sangat cantik dan menarik."),
          new Komentars(
              gambar: gambarKomen,
              nama: namaKomen,
              tgl: tanggalKomen,
              komen: textKomen),

          // tambahkan komen
          new Container(
              padding: new EdgeInsets.all(20),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("Tinggalkan Komentar:",
                      style: new TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  new TextField(
                      controller: controllerIn,
                      decoration: new InputDecoration(hintText: "Tulis Disini"),
                      onSubmitted: (String str) {
                        setState(() {
                          textKomen = str;
                          gambarKomen = "user1.jpeg";
                          namaKomen = "Elko Dedy Pratama";
                          tanggalKomen = "baru saja";
                          controllerIn.text = "";
                        });
                        _alertDialog("Komentar Berhasil Ditambahkan");
                        _snackbar("Komentar Berhasil Ditambahkan");
                      }),
                ],
              )),
          new MyFooter(),
        ]));
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama, this.kategori});
  final String nama;
  final String kategori;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(25.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                new Text(
                  "$kategori",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.favorite,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.airplanemode_active,
            teks: "Go Now",
          ),
          new Iconteks(
            icon: Icons.monetization_on,
            teks: "Price",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: MyColors.warnaTema,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Text(
            "     Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \n\n     Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n     Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}

class Komentars extends StatelessWidget {
  Komentars({this.gambar, this.nama, this.tgl, this.komen});
  String gambar;
  String nama;
  String tgl;
  String komen;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new ClipOval(
                child: new SizedBox(
                    width: 50,
                    height: 50,
                    child: new Material(
                      child: new InkWell(
                          child: new Image.asset(
                        "assets/img/$gambar",
                        fit: BoxFit.cover,
                      )),
                    )),
              ),
              new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0))
            ],
          ),
          new Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            width: MediaQuery.of(context).size.width * 0.75,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(nama,
                    style: new TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                new Text(tgl,
                    style: new TextStyle(fontSize: 15, color: Colors.grey)),
                new Text(komen, style: new TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
