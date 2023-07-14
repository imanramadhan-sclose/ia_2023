import 'package:flutter/material.dart';

class WhatsOnBannerOn extends StatefulWidget {
  const WhatsOnBannerOn({Key? key}) : super(key: key);

  @override
  State<WhatsOnBannerOn> createState() => _WhatsOnBannerOnState();
}

class _WhatsOnBannerOnState extends State<WhatsOnBannerOn> {
  int activePage = 1;
  late PageController _pageController;

  List<String> images = [
    "lib/assets/banners/Artemis-removebg.png",
    "lib/assets/banners/Fluter.jpg",
    "lib/assets/banners/io.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: activePage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  AnimatedContainer slider(int pagePosition, bool active) {
    double margin = active ? 0 : 10;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(images[pagePosition]),
        ),
      ),
    );
  }

  List<Widget> indicators(int imagesLength, int currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }

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
                      bool active = pagePosition == activePage;
                      return slider(pagePosition, active);
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
