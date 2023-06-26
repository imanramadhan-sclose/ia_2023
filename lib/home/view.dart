import 'package:flutter/material.dart';
import './controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Iman Ramadhan'),
          backgroundColor: Colors.red,
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: [
              const UserAccountsDrawerHeader(
                  accountName: Text('Iman Ramadhan'),
                  accountEmail: Text('ramadhan.iman.ir@gmail.com')),
              const ListTile(
                title: Text('Home'),
                leading: CircleAvatar(
                  child: Icon(Icons.apps),
                ),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pushNamed('/kategori'),
                title: const Text('Kategori'),
                leading: const CircleAvatar(
                  child: Icon(Icons.archive),
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text('Register'),
                leading: CircleAvatar(
                  child: Icon(Icons.verified_user),
                ),
              )
            ],
          ),
        ),
        body: const SingleChildScrollView());
  }
}
