import 'package:flutter/material.dart';

class DeliveryBanner extends StatefulWidget {
  const DeliveryBanner({Key? key}) : super(key: key);

  @override
  State<DeliveryBanner> createState() => _DeliveryBannerState();
}

class _DeliveryBannerState extends State<DeliveryBanner>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelColor: Colors.blue,
          controller: _tabController,
          tabs: const [
            Tab(text: 'MCC E-CARD PREVILEGES'),
            Tab(text: 'CATALOG REDEMPTION'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah kartu dalam satu baris
                  mainAxisSpacing: 10.0, // Spasi antara baris
                  crossAxisSpacing: 10.0, // Spasi antara kolom
                ),
                itemCount: 11, // Jumlah total kartu
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.green,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Center(child: Text('Elevated Card ${index + 1}')),
                    ),
                  );
                },
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah kartu dalam satu baris
                  mainAxisSpacing: 10.0, // Spasi antara baris
                  crossAxisSpacing: 10.0, // Spasi antara kolom
                ),
                itemCount: 5, // Jumlah total kartu
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.green,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Center(child: Text('Elevated Card ${index + 1}')),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
