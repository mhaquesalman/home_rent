import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Color colorBg = Color(int.parse("0xFFF7F7F7"));
Color textColor = Colors.grey;
Color secondaryTextColor = Color(int.parse("0xFFD4D4D4"));
const place = LatLng(23.737789, 90.401332);
const images = [
  "https://cdn.pixabay.com/photo/2022/04/10/19/33/house-7124141_1280.jpg",
  "https://cdn.pixabay.com/photo/2017/09/09/21/58/house-2733660_1280.jpg",
  "https://cdn.pixabay.com/photo/2022/04/10/19/33/house-7124141_1280.jpg",
  "https://cdn.pixabay.com/photo/2017/09/09/21/58/house-2733660_1280.jpg",
  "https://cdn.pixabay.com/photo/2017/09/09/21/58/house-2733660_1280.jpg",
  "https://cdn.pixabay.com/photo/2017/09/09/21/58/house-2733660_1280.jpg",
  "https://cdn.pixabay.com/photo/2017/09/09/21/58/house-2733660_1280.jpg",
  "https://cdn.pixabay.com/photo/2017/09/09/21/58/house-2733660_1280.jpg",
];