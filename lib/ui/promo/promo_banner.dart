import 'package:flutter/material.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({Key? key}) : super(key: key);

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = ''; // Nilai awal query adalah string kosong
  List<int> _filteredIndexes = List.generate(15, (index) => index);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterData() {
    List<int> tempIndexes = [];
    for (int i = 0; i < 15; i++) {
      String cardText = 'Elevated Card ${i + 1}';
      if (cardText.toLowerCase().contains(_searchQuery.toLowerCase())) {
        tempIndexes.add(i);
      }
    }
    setState(() {
      _filteredIndexes = tempIndexes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black),
              ),
            ),
            child: Text(
              'TENANT PROMO',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (query) {
                setState(() {
                  // Update nilai _searchQuery sesuai dengan query yang dimasukkan
                  _searchQuery = query;
                  // Lakukan filter data setiap kali query berubah
                  _filterData();
                });
              },
              onSubmitted: (query) {
                // Lakukan filter data ketika submit pencarian
                setState(() {
                  // Update nilai _searchQuery sesuai dengan query yang dimasukkan
                  _searchQuery = query;
                  // Lakukan filter data ketika submit pencarian
                  _filterData();
                });
              },
            ),
          ),
          Text(
            _searchQuery.isNotEmpty ? ('Search For "$_searchQuery"') : '',
            style: const TextStyle(fontSize: 11.0, fontStyle: FontStyle.italic),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: _filteredIndexes.length,
              itemBuilder: (context, index) {
                int filteredIndex = _filteredIndexes[index];
                return Card(
                  color: Colors.green,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Text('Elevated Card ${filteredIndex + 1}'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
