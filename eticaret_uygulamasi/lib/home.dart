import 'package:eticaret_uygulamasi/categories.dart';
import 'package:eticaret_uygulamasi/label.dart';
import 'package:flutter/material.dart';

import 'bottom_navigationbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          //Sayfa Sütunu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                //Başlık
                buildBaslik(),

                //Banner
                buildBanner(),

                //Butonlar
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 5, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildNavigateIcons(
                        ikon: Icons.menu,
                        ikonYazisi: 'Kategoriler',
                        widget: CategoriesPage(),
                        context: context,
                        //aşagıda buildNavigateIcons fonksiyonunu tanımladık
                        //orda context ve widget verilerini de verebilmek için değişken
                        //olarak tanımladık required demedıgımız taktirde nullable hatası
                        //verıyordu sonra duzelttık gestureDetector sayesınde tıklanma ozellıgı
                        //Navigator.push ıle de sayfa degıstırme ozellıgı tanımladık
                        //hangi widgeta gitmesini belirtmek ıcın widget degıskenı
                        //nerede bulundugunu anlaması ıcın de context degıskenı verdık
                        //ve burada vermıs oldugumuz propertylere atamalar gerceklestırdık
                      ),
                      buildNavigateIcons(
                        ikon: Icons.star_border,
                        ikonYazisi: 'Favorites',
                        widget: CategoriesPage(),
                        context: context,
                      ),
                      buildNavigateIcons(
                        ikon: Icons.card_giftcard,
                        ikonYazisi: 'Gifts',
                        widget: CategoriesPage(),
                        context: context,
                      ),
                      buildNavigateIcons(
                        ikon: Icons.people,
                        ikonYazisi: 'Best Selling',
                        widget: CategoriesPage(),
                        context: context,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                //Sales Title
                Text(
                  'Sales',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xff0a1034),
                  ),
                ),
                SizedBox(height: 10),
                //Sales Items
                Row(
                  children: [
                    Expanded(
                      child: buildSalesItems(
                          indirim: '%20',
                          resimIsmi: 'phone',
                          text: 'Huawei',
                          renk: Colors.grey.shade200),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: buildSalesItems(
                          indirim: '%30',
                          resimIsmi: 'phone',
                          text: 'Xiaomi',
                          renk: Colors.grey.shade200),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: buildSalesItems(
                          indirim: '%50',
                          resimIsmi: 'phone',
                          text: 'Samsung',
                          renk: Colors.grey.shade200),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: buildSalesItems(
                          indirim: '%80',
                          resimIsmi: 'phone',
                          text: 'Iphone',
                          renk: Colors.grey.shade200),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Bottom Navigation Bar

          //**********************************
          //buralara yarın tekrardan bı goz gezdır
          buildBottomNavigationBar(page: 'home'),
        ],
      ),
    );
  }
}

//Fonksiyonlar
//**********************************

Container buildSalesItems({
  required String text,
  required String resimIsmi,
  required String indirim,
  required Color renk,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: renk,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //%50
        label(indirim),
        SizedBox(height: 10),
        //telefon resmi
        Image.asset(
          'assets/images/$resimIsmi.png',
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            //textAlign etki etmeyecek çunkü üst mertebelerde axisalignmentlarda start verdık
            //hıyerarsıden oturu bunu asmak ıcın Center wıdgetını kullanacagız
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}

Widget buildNavigateIcons(
    {IconData ikon = Icons.menu,
    String ikonYazisi = 'Default',
    required Widget widget,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget),
      );
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE0Ecf8),
          ),
          child: Icon(
            ikon,
            color: Color(0xff0001FC),
            size: 22,
          ),
        ),
        SizedBox(height: 8),
        Text(
          ikonYazisi,
          style: TextStyle(
              color: Color(0xff0001FC),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Padding buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      'Home',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Color(0xff0a1034),
      ),
    ),
  );
}

Container buildBanner() {
  return Container(
    margin: EdgeInsets.only(top: 24),
    padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
    decoration: BoxDecoration(
      color: Color(0xff0001FC),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jbl Home Speaker',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
              SizedBox(height: 6),
              Text(
                '1250 TL',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/speaker.png',
            )),
      ],
    ),
  );
}
