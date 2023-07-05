import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HeaderHome extends StatefulWidget {
  const HeaderHome({super.key});

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
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
