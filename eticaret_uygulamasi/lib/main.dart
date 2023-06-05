import 'package:eticaret_uygulamasi/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BenimUygulamam());
}

class BenimUygulamam extends StatefulWidget {
  const BenimUygulamam({Key? key}) : super(key: key);

  @override
  State<BenimUygulamam> createState() => _BenimUygulamamState();
}

class _BenimUygulamamState extends State<BenimUygulamam> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}
