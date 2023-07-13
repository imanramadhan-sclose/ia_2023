import 'package:flutter/material.dart';

class MCCardTabs extends StatefulWidget {
  const MCCardTabs({Key? key}) : super(key: key);

  @override
  State<MCCardTabs> createState() => _MCCardTabsState();
}

class _MCCardTabsState extends State<MCCardTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
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
                itemCount: 3, // Jumlah total kartu
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
                itemCount: 3, // Jumlah total kartu
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
                itemCount: 3, // Jumlah total kartu
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
