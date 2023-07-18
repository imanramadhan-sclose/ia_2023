import 'package:flutter/material.dart';
import '../header_home.dart';
import 'promo_banner.dart';

class Promo extends StatefulWidget {
  const Promo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MCC',
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: Padding(
          padding: EdgeInsets.only(top: 32, right: 32, left: 32),
          child: Column(
            children: [
              HeaderHome(),
              PromoBanner(),
            ],
          ),
        ),
      ),
    );
  }
}
