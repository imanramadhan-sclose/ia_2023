import 'package:flutter/material.dart';

class WhatsOnInfo extends StatelessWidget {
  const WhatsOnInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Row(
        children: [
          Text('profile'),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Hi!'), Text('Point | 0')],
          )),
          Text('Scanner')
        ],
      ),
    );
  }
}
