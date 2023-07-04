import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCC',
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              child: const Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [Text('logo Ciputra')],
                  )),
                  badges.Badge(
                    badgeContent: Text('3'),
                    child: Icon(Icons.notifications),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: const Row(
                children: [
                  Text('profile'),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Hi!'), Text('Point | 0')],
                  )),
                  Text('Scanner')
                ],
              ),
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
              padding: const EdgeInsets.all(32),
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

PageController _pageControllerHot =
    PageController(viewportFraction: 0.8, initialPage: activePageHot);
@override
void initStateHot() {
  _pageControllerHot =
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
