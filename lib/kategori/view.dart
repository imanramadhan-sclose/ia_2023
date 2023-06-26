import 'package:flutter/material.dart';
import './controller.dart';
import './detail/view.dart';

class KategoriView extends StatefulWidget {
  const KategoriView({super.key});

  @override
  State<KategoriView> createState() => _KategoriViewState();
}

class _KategoriViewState extends KategoriController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Kategori'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext _) => DetailKategoriView(
                      namaMakanan: 'Seafood',
                    ))),
            leading: CircleAvatar(
              backgroundColor: Colors.red.withOpacity(.2),
              child: const Icon(
                Icons.restaurant,
                color: Colors.red,
              ),
            ),
            title: const Text('Makanan'),
          )
        ],
      ),
    );
  }
}
