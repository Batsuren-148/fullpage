// import 'package:flutter/material.dart';

// class CustomPageScrollPhysics extends PageScrollPhysics {
//   CustomPageScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

//   @override
//   CustomPageScrollPhysics applyTo(ScrollPhysics? ancestor) {
//     return CustomPageScrollPhysics(parent: buildParent(ancestor));
//   }

//   double get pageSpacing => 10.0; // Adjust the spacing between pages as needed

//   @override
//   Simulation? createBallisticSimulation(
//       ScrollMetrics position, double velocity) {
//     final double page = position.pixels / position.viewportDimension;
//     final double currentPage = page.roundToDouble();

//     if (velocity.abs() >= tolerance.velocity) {
//       final double nextPage =
//           velocity < 0 ? currentPage + 1.0 : currentPage - 1.0;

//       return ScrollSpringSimulation(spring, page, nextPage, velocity,
//           tolerance: tolerance);
//     }

//     return super.createBallisticSimulation(position, velocity);
//   }
// }

// class CustomPageView extends StatefulWidget {
//   @override
//   _CustomPageViewState createState() => _CustomPageViewState();
// }

// class _CustomPageViewState extends State<CustomPageView> {
//   PageController _pageController = PageController();
//   int _currentPage = 0;

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _handlePageChange(int page) {
//     setState(() {
//       _currentPage = page;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _pageController,
//       physics: CustomPageScrollPhysics(),
//       itemCount: 5, // Number of pages
//       onPageChanged: _handlePageChange,
//       itemBuilder: (context, index) {
//         return Container(
//           color: Colors.blue,
//           child: Center(
//             child: Text(
//               'Page $index',
//               style: TextStyle(fontSize: 24.0),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
