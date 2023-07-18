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
      padding: const EdgeInsets.symmetric(vertical: 31),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  'lib/assets/main-logo.png', // Ubah sesuai dengan path dan nama file gambar logo Anda
                  height: 50, // Sesuaikan tinggi gambar sesuai kebutuhan
                ),
              ],
            ),
          ),
          const badges.Badge(
            badgeContent: Text('3'),
            child: Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}
