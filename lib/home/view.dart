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
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: Text(
              'Hallo',
              style: TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(.2),
                            borderRadius:
                                BorderRadiusDirectional.circular(10.0)),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.hotel,
                            color: Colors.red,
                          ),
                        )),
                    const Text('Hotel')
                  ],
                )
              ])
        ]))
      ],
    ));
  }
}
