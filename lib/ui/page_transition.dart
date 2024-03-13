import 'package:flutter/material.dart';

PageRouteBuilder customPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // const begin = Offset(1.0, 0.0);
      // const end = Offset.zero;
      // const curve = Curves.easeInOut;
      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //
      // var offsetAnimation = animation.drive(tween);
      // return SlideTransition(position: offsetAnimation, child: child);
      const curve = Curves.easeInOutQuad;
      var tween = Tween<double>(begin: 0, end: 1);
      var opacityAnimation = animation.drive(tween);

      return FadeTransition(opacity: opacityAnimation,
          child: child);
    },
    transitionDuration: const Duration(milliseconds: 2000),
  );
}

PageRouteBuilder defaultPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
  );
}