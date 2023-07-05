import 'package:flutter/material.dart';

class WhatsOnBannerOn extends StatefulWidget {
  const WhatsOnBannerOn({super.key});

  @override
  State<WhatsOnBannerOn> createState() => _WhatsOnBannerOnState();
}

class _WhatsOnBannerOnState extends State<WhatsOnBannerOn> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

List<String> images = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
  "https://wallpaperaccess.com/full/2637581.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU"
];

int activePage = 1;

PageController _pageController =
    PageController(viewportFraction: 0.8, initialPage: activePage);

@override
void initState() {
  _pageController =
      PageController(viewportFraction: 0.8, initialPage: activePage);
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
