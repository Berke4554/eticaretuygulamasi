import 'package:eticaret_uygulamasi/bottom_navigationbar.dart';
import 'package:eticaret_uygulamasi/header.dart';
import 'package:eticaret_uygulamasi/product_detail.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String categoryTitle;
  CategoryPage(this.categoryTitle);

  final List<Map> products = [
    {'isim': 'Samsung X 45', 'fotograf': 'phone', 'fiyat': '100'},
    {'isim': 'Iphone 11 Pro', 'fotograf': 'phone', 'fiyat': '100'},
    {'isim': 'Macbook', 'fotograf': 'phone', 'fiyat': '100'},
    {'isim': 'Takamura', 'fotograf': 'phone', 'fiyat': '100'},
    {'isim': 'Makunouchi', 'fotograf': 'phone', 'fiyat': '100'},
    {'isim': 'Samsung X 45', 'fotograf': 'phone', 'fiyat': '100'},
    {'isim': 'Samsung X 45', 'fotograf': 'phone', 'fiyat': '100'}
  ];
  //buradan hıc bısı anlamadım desem yerıdır
  //*****************************************

  //Maplerle dolu bir liste
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
                    header(categoryTitle, context),

                    Expanded(
                      //buradan hıc bısı anlamadım desem yerıdır
                      //*****************************************
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: products
                            .map(
                              (Map products) => buildIcerikKonteyner(
                                itemDosyasi: products['fotograf'],
                                baslik: products['isim'],
                                fiyat: products['fiyat'],
                                context: context,
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
              buildBottomNavigationBar(page: 'search'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIcerikKonteyner({
    required String itemDosyasi,
    required String baslik,
    required String fiyat,
    required context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailPage(baslik)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: Offset(0, 16),
              blurRadius: 24,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child:
                  Center(child: Image.asset('assets/images/$itemDosyasi.png')),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    baslik,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  SizedBox(height: 2),
                  Text(
                    fiyat.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
