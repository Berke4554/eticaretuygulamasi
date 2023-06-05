import 'package:flutter/material.dart';

label(String text) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: Color(0xffe0ecf8),
    ),
    child: Text(
      text,
      style: TextStyle(color: Colors.deepPurple, fontSize: 16),
    ),
  );
}
