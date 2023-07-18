import 'package:flutter/material.dart';
import '../header_home.dart';
import './whats_on.info.dart';
import './whats_on.banner_on.dart';
import './whats_on.banner_hot.dart';

class WhatsOn extends StatefulWidget {
  const WhatsOn({super.key});

  @override
  State<WhatsOn> createState() => _WhatsOnState();
}

class _WhatsOnState extends State<WhatsOn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCC',
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: ListView(
          padding: const EdgeInsets.all(32),
          children: const [
            HeaderHome(),
            WhatsOnInfo(),
            WhatsOnBannerOn(),
            WhatsOnBannerHot(),
          ],
        ),
      ),
    );
  }
}
