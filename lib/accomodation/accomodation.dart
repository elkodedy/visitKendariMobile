import 'package:flutter/material.dart';
import 'package:elkodedy_final/myColors.dart';
import './hotel.dart';

class Accomodation extends StatefulWidget {
  @override
  _AccomodationState createState() => _AccomodationState();
}

class _AccomodationState extends State<Accomodation>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('KENDARI HOTELS'),
          bottom: new TabBar(controller: controller, tabs: <Widget>[
            new Tab(
                icon: new Icon(
                  Icons.business,
                ),
                text: "Claro Hotel"),
            new Tab(
                icon: new Icon(
                  Icons.account_balance,
                ),
                text: "Same Hotel"),
            new Tab(
                icon: new Icon(
                  Icons.location_city,
                ),
                text: "Plaza Inn"),
          ]),
          backgroundColor: MyColors.warnaTema,
        ),
        body: new TabBarView(controller: controller, children: <Widget>[
          new Hotel(
              nama: "Claro Hotel", gambar: "claro1.jpg", kategori: "Bintang 3"),
          new Hotel(
              nama: "Same Hotel", gambar: "same1.jpg", kategori: "Bintang 3"),
          new Hotel(
              nama: "Plaza Inn",
              gambar: "plazainn1.jpg",
              kategori: "Bintang 3"),
        ]));
  }
}

