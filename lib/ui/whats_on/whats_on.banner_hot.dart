import 'package:flutter/material.dart';

class WhatsOnBannerHot extends StatefulWidget {
  const WhatsOnBannerHot({super.key});

  @override
  State<WhatsOnBannerHot> createState() => _WhatsOnBannerHotState();
}

class _WhatsOnBannerHotState extends State<WhatsOnBannerHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 17),
              child: const Text("What's ")),
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

PageController _pageController =
    PageController(viewportFraction: 0.8, initialPage: activePage);

int activePage = 1;

@override
void initState() {
  _pageController =
      PageController(viewportFraction: 0.8, initialPage: activePage);
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
