import 'package:flutter/material.dart';
import './controller.dart';

class DetailKategoriView extends StatefulWidget {
  final String? namaMakanan;
  const DetailKategoriView({super.key, this.namaMakanan});

  @override
  State<DetailKategoriView> createState() => _DetailKategoriViewState();
}

class _DetailKategoriViewState extends DetailKategoriController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Kategori'),
      ),
      body: Text(widget.namaMakanan ?? 'Nama Makanan Tidak Tersedia'),
    );
  }
}
