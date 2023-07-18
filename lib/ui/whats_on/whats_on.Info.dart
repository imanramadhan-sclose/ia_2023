import 'package:flutter/material.dart';

class WhatsOnInfo extends StatelessWidget {
  const WhatsOnInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 31),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'lib/assets/default-profile.png',
              width: 40,
              height: 40,
            ),
          ),
          const Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Hi!'), Text('Point | 0')],
          )),
          const Icon(
            Icons.qr_code_scanner,
            size: 48,
          )
        ],
      ),
    );
  }
}
