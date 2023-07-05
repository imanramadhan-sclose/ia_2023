// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'WhatsOn.header.dart';
import './WhatsOn.info.dart';

class WhatsOn extends StatefulWidget {
  const WhatsOn({super.key});

  @override
  State<WhatsOn> createState() => _WhatsOnState();
}

class _WhatsOnState extends State<WhatsOn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCC',
      home: Scaffold(
        body: ListView(
          children: [
            const WhatsOnHeader(),
            const WhatsOnInfo(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                            itemCount: images.length,
                            pageSnapping: true,
                            controller: _pageController,
                            onPageChanged: (page) {
                              setState(() {
                                activePage = page;
                              });
                            },
                            itemBuilder: (context, pagePosition) {
                              //checking active position
                              bool active = pagePosition == activePage;
                              return slider(images, pagePosition, active);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicators(images.length, activePage),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(17),
              alignment: Alignment.center,
              child: const Text("What's Hot"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                            itemCount: images.length,
                            pageSnapping: true,
                            controller: _pageController,
                            onPageChanged: (page) {
                              setState(() {
                                activePageHot = page;
                              });
                            },
                            itemBuilder: (context, pagePosition) {
                              //checking active position
                              return Container(
                                margin: const EdgeInsets.all(10),
                                child: Image.network(
                                  images[pagePosition],
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicatorsHot(images.length, activePageHot),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> images = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
  "https://wallpaperaccess.com/full/2637581.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU"
];

PageController _pageController =
    PageController(viewportFraction: 0.8, initialPage: activePage);
@override
void initState() {
  _pageController =
      PageController(viewportFraction: 0.8, initialPage: activePage);
}

int activePage = 1;
List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 0 : 10;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

@override
void initStateHot() {
  _pageController =
      PageController(viewportFraction: 0.8, initialPage: activePageHot);
}

int activePageHot = 1;
List<Widget> indicatorsHot(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
