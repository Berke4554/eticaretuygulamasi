import 'package:eticaret_uygulamasi/category.dart';
import 'package:eticaret_uygulamasi/header.dart';
import 'package:eticaret_uygulamasi/stiller.dart';
import 'package:flutter/material.dart';

import 'bottom_navigationbar.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> kategoriler = [
    'All',
    'Computers',
    'Accessories',
    'Smartphones',
    'Smart objects',
    'Speakers',
    'Smartphones',
    'Smart objects',
    'Speakers'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    SizedBox(height: 6),

                    //Başlık
                    header('Categories', context),

                    //Kategoriler
                    Expanded(
                      child: ListView(
                        //ListView a Expanden verme sebebımız bır boyutunun olmasını ıstememız
                        //boyuta ıhtıyacı olmasının sebebı aşagıya dogru sureklı eleman aldıgından
                        //bellı bır boyuta sahıp olmalıdır olmazsa sonsuza kadar gıder
                        //ve hatayla karsılasırız ekranda bısı goremeyız
                        //Expanded alabıldıgın tum boyutu al demektır
                        children: kategoriler
                            .map((String title) =>
                                buildCategory(title: title, context: context))
                            .toList(),
                        //.map kullanımını öğren bi ara burası ezber oldu bi tık şu anlık
                        //**************
                      ),
                    ),
                  ],
                ),
              ),

              //BottomNavigation
              buildBottomNavigationBar(page: 'search'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategory({required String title, required context}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(title),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        width: double.infinity,
        //olabilcegın kadar buyuk ol demek
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                //golge rengi
                blurRadius: 8,
                //bulanıklastırma kat sayısı
                offset: Offset(0, 4)
                //offset hangı eksene golge verecegını ayarlar x,y olarak
                )
          ],
          color: Colors.amber,
        ),
        child: Text(
          title,
          style: yazistilim,
        ),
      ),
    );
  }
}
