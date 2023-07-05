import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class WhatsOnHeader extends StatefulWidget {
  const WhatsOnHeader({super.key});

  @override
  State<WhatsOnHeader> createState() => _WhatsOnHeaderState();
}

class _WhatsOnHeaderState extends State<WhatsOnHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Row(
        children: [
          Expanded(
              child: Row(
            children: [Text('logo Ciputra')],
          )),
          badges.Badge(
            badgeContent: Text('3'),
            child: Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}
