import 'package:flutter/material.dart';

Widget header(String baslik, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      //geri ikonu
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          size: 27,
        ),
      ),
      SizedBox(height: 24),

      //Kategoriler
      Text(
        baslik,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      SizedBox(height: 16),
    ],
  );
}
