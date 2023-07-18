import 'package:flutter/material.dart';
import '../header_home.dart';
import 'delivery_banner.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MCC',
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 32, right: 32, left: 32),
          child: Column(
            children: [
              HeaderHome(),
              Expanded(
                child: DeliveryBanner(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
