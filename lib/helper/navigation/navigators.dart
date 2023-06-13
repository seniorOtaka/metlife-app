import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (_, animation, secondaryAnimation) => widget,
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (_, animation, secondaryAnimation, c) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOutBack;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: c,
            );
            // FedTransition(opacity: a, child: c),
          }),
    );

Future navigateAndEnd(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

void navigateBack(
  context,
) =>
    Navigator.pop(context);

dynamic token = '';
String? uId;
