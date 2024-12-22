import 'package:flutter/material.dart';

Gradient gradientBackground() => LinearGradient(
    begin: Alignment.topCenter, end: Alignment.bottomCenter,
    colors: [
      Color(int.parse("0xffA0DAFB")),
      Color(int.parse("0xff0A8ED9"))
    ]
);

Gradient gradientBackgroundForImage() => LinearGradient(
    begin: Alignment.topCenter, end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black.withOpacity(0.6), // Start with black
    ]
);

Gradient gradientBackgroundForMap() => LinearGradient(
    begin: Alignment.topCenter, end: Alignment.bottomCenter,
    colors: [
      Colors.white10,
      Colors.white10,
      Colors.white10,
      Colors.white,
      Colors.white,
    ]
);