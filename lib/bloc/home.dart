import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import '../plugin/circular_bottom_navigation/tab_item.dart';
import '../plugin/circular_bottom_navigation/circular_bottom_navigation.dart';
import '../ui/whats_on/whats_on.dart';
import '../ui/mc_card/mc_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Directionality(
        textDirection: TextDirection.ltr,
        child: MyHomePage(title: 'MCC'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "What's On",
      Colors.blue,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      Icons.search,
      "MCard",
      Colors.orange,
      labelStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.search,
      "test",
      Colors.orange,
      labelStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            child: bodyContainer(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  _onGestureLeft();
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  _onGestureRight();
                }
              },
              child: bottomNav(),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Widget selectWidget;
    switch (selectedPos) {
      case 0:
        selectWidget = const WhatsOn();
        break;
      case 1:
        selectWidget = const MCCard();
        break;
      case 2:
        selectWidget = const WhatsOn();
        break;
      default:
        selectWidget = const WhatsOn();
        break;
    }

    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 300),
      reverse: selectedPos < _navigationController.value!,
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: selectWidget,
    );
  }

  void _onGestureLeft() {
    if (selectedPos < tabItems.length - 1) {
      setState(() {
        selectedPos++;
        _navigationController.value = selectedPos;
      });
    }
  }

  void _onGestureRight() {
    if (selectedPos > 0) {
      setState(() {
        selectedPos--;
        _navigationController.value = selectedPos;
      });
    }
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
