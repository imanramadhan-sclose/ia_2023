import 'package:flutter/material.dart';

class WhatsOnBannerHot extends StatefulWidget {
  const WhatsOnBannerHot({Key? key}) : super(key: key);

  @override
  State<WhatsOnBannerHot> createState() => _WhatsOnBannerHotState();
}

class _WhatsOnBannerHotState extends State<WhatsOnBannerHot> {
  int activePage = 1;
  late PageController _pageController;

  List<String> images = [
    "lib/assets/banners/Artemis-removebg.png",
    "lib/assets/banners/Fluter.jpg",
    "lib/assets/banners/io.jpg",
    "lib/assets/banners/pegasus 1.jpg",
    "lib/assets/banners/pegasus 2.jpg",
    "lib/assets/banners/pegasus.jpg"
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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 17),
          child: const Text("What's "),
        ),
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
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(
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
          children: indicators(images.length, activePage),
        ),
      ],
    );
  }
}
