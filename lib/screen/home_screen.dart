import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.amber,
    Colors.brown,
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _scrollToNextPage() {
    if (_currentPageIndex < colors.length - 1) {
      pageController.animateToPage(
        _currentPageIndex + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToPreviousPage() {
    if (_currentPageIndex > 0) {
      pageController.animateToPage(
        _currentPageIndex - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerSignal: (PointerSignalEvent event) {
          // mouse scroll then page will change           
          if (event is PointerScrollEvent) {
            if (event.scrollDelta.dy > 0) {
              _scrollToNextPage();
            } else if (event.scrollDelta.dy < 0) {
              _scrollToPreviousPage();
            }

            // if (event.kind == PointerDeviceKind.mouse) {
            //   print('Mouse scrolling');
            // } else if (event.kind == PointerDeviceKind.touch) {
            //   print('Touchpad scrolling');
            // }
          }
        },
        child: GestureDetector(
          // drag up or down then change page
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              // Drag down, go to previous page
              _scrollToPreviousPage();
            } else if (details.primaryVelocity! < 0) {
              // Drag up, go to next page
              _scrollToNextPage();
            }
          },
          child: PageView.builder(
            pageSnapping: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: _onPageChanged,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: double.infinity,
                color: colors[index],
                child: Center(
                  child: Text(
                    'Page $index',
                    style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
            itemCount: colors.length,
          ),
        ),
      ),
    );
  }
}
