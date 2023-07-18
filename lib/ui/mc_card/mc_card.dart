import 'package:flutter/material.dart';
import '../header_home.dart';
import 'mc_card.tabs.dart';

class MCCard extends StatefulWidget {
  const MCCard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MCCardState createState() => _MCCardState();
}

class _MCCardState extends State<MCCard> {
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
              Expanded(
                child: MCCardTabs(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
