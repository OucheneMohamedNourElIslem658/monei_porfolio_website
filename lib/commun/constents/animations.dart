import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomAnimations {
  static final appBarAnimation = <Effect<double>>[
    CustomEffect(
      begin: 0,
      end: -52,
      builder: (context, value, child) {
        return Positioned(
          top: value,
          left: 0,
          right: 0,
          child: child
        );
      },
    )
  ];
}