import 'package:flutter/material.dart';

class ColorResources {
  //...

  static const background = Color(0xFFFED7A5);

  static const green = Color(0xFF2D4354);

  static const dark = Color(0xFF20212B);

  static LinearGradient get backgroundGradient {
    return LinearGradient(
      colors: const [
        Color(0xFF2D4354),
        Color(0xFF73766A),
        Color(0xFFFED7A5),
        Color(0xFF9E6752),
        Color(0xFF534145),
        Color(0xFF20212B),
      ].map((v) {
        return v.withOpacity(.3);
      }).toList(),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
    );
  }

  static LinearGradient get backgroundGradient2 {
    return LinearGradient(
      colors: [
        const Color(0xFFFED7A5).withOpacity(.5),
        const Color(0xFFFED7A5).withOpacity(.5),
        const Color(0xFFFED7A5).withOpacity(.5),
        const Color(0xFFFED7A5).withOpacity(.5),
        const Color(0xFFFED7A5).withOpacity(.5),
        const Color(0xFFFED7A5).withOpacity(.5),
        const Color(0xFF73766A),
        const Color(0xFF2D4354),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.clamp,
    );
  }
}
