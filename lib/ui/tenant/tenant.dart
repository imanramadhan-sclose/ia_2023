import 'package:flutter/material.dart';
import '../header_home.dart';
import 'tenant_banner.dart';

class Tenant extends StatefulWidget {
  const Tenant({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TenantState createState() => _TenantState();
}

class _TenantState extends State<Tenant> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MCC',
      home: Scaffold(
        body: Column(
          children: [
            HeaderHome(),
            Expanded(
              child: TenantBanner(),
            ),
          ],
        ),
      ),
    );
  }
}
