import 'package:flutter/material.dart';

class TenantBanner extends StatefulWidget {
  const TenantBanner({Key? key}) : super(key: key);

  @override
  State<TenantBanner> createState() => _TenantBannerState();
}

class _TenantBannerState extends State<TenantBanner> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
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
    );
  }
}
