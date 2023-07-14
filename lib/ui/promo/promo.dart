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
        body: Column(
          children: [
            HeaderHome(),
            Expanded(
              child: PromoBanner(),
            ),
          ],
        ),
      ),
    );
  }
}
