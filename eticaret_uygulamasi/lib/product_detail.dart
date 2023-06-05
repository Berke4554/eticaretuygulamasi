import 'package:eticaret_uygulamasi/bottom_navigationbar.dart';
import 'package:eticaret_uygulamasi/stiller.dart';
import 'package:flutter/material.dart';

import 'header.dart';

class ProductDetailPage extends StatefulWidget {
  final String baslikIsmi;
  ProductDetailPage(this.baslikIsmi);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}
//*************************************
//1:59 da kaldım

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<Color> renkler = [
    Colors.deepPurpleAccent.shade100,
    Colors.black,
    Colors.teal,
    Colors.blueGrey,
  ];
  List<int> kapasiteler = [64, 256, 512];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              //Sayfa Sütunu
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Başlık
                    SizedBox(height: 6),
                    header(widget.baslikIsmi, context),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListView(
                          children: [
                            //Yeni Etiketi
                            //label('Yeni'),
                            //Ürün foto
                            Center(
                              child: Container(
                                width: 250,
                                child: Image.asset('assets/images/phone.png'),
                              ),
                            ),

                            //Renk secenekleri
                            Text(
                              'Color',
                              style: yazistilim,
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: renkler
                                  .map((Color color) => renkOption(color))
                                  .toList(),
                            ),
                            SizedBox(height: 30),

                            //hafıza seceneklerı
                            Text(
                              'Kapasite',
                              style: yazistilim,
                            ),
                            SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: kapasiteler
                                  .map((int sayi) => buildKapasiteSecenek(sayi))
                                  .toList(),
                            ),
                            SizedBox(height: 16),

                            //Satın al butonu
                            ElevatedButton(
                              onPressed: () {},
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text('Satın Al',
                                    style: yazistilim,
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              buildBottomNavigationBar(page: ''),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildKapasiteSecenek(int kapasite) {
  return Text(
    '$kapasite gb     ',
    style: TextStyle(
        color: kapasite == 64 ? Colors.blue : Colors.black54, fontSize: 16),
  );
}

Widget renkOption(Color renk) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: renk,
      border: renk == Colors.black
          ? Border.all(color: Colors.lightBlue, width: 3)
          : null,
    ),
    width: 23,
    height: 23,
  );
}
