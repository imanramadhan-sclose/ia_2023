import 'package:flutter/material.dart';
import './home/view.dart';
import './kategori/view.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world by Iman',
      routes: {
        '/': (BuildContext _) => const HomeView(),
        '/kategori': (BuildContext _) => const KategoriView()
      },
      initialRoute: '/',
    );
  }
}
