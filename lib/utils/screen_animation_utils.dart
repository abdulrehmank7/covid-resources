import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> fadeScreenTransition(dynamic screen) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, anotherAnimation) {
        return screen;
      },
      transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      });
}

PageRouteBuilder<dynamic> rightSlideScreenTransition(dynamic screen) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, anotherAnimation) {
        return screen;
      },
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
          child: child,
        );
      });
}
