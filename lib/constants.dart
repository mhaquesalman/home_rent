import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_rent/house_model.dart';

Color colorBg = Color(int.parse("0xFFF7F7F7"));
Color textColor = Colors.grey;
Color secondaryTextColor = Color(int.parse("0xFFD4D4D4"));
Color menuColor = Color(int.parse("0xFF2A6586"));
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

List<HouseModel> houses = [
  HouseModel(
    title: "Dreamsville House",
    subtitle: "Jl Sultan Iskandar Muda",
    bedrooms: 4,
    bathrooms: 3,
    description: "A luxurious modern house with stunning architecture.",
    imageUrl: "https://example.com/house1.jpg",
    rentAmount: 2500000000.0,
    ownerName: "John Doe",
  ),
  HouseModel(
    title: "Orchard House",
    subtitle: "Jl Cilandak Tengah",
    bedrooms: 5,
    bathrooms: 4,
    description: "Spacious and elegant, perfect for families.",
    imageUrl: "https://example.com/house2.jpg",
    rentAmount: 2000000000.0,
    ownerName: "Jane Smith",
  ),
  HouseModel(
    title: "The Hollies House",
    subtitle: "Jl Kebayoran Lama",
    bedrooms: 6,
    bathrooms: 4,
    description: "Located near the city center with easy access to amenities.",
    imageUrl: "https://example.com/house3.jpg",
    rentAmount: 3000000000.0,
    ownerName: "Robert Brown",
  ),
  HouseModel(
    title: "Seaside Retreat",
    subtitle: "Jl Sunset Boulevard",
    bedrooms: 3,
    bathrooms: 2,
    description: "Cozy and peaceful with breathtaking views.",
    imageUrl: "https://example.com/house4.jpg",
    rentAmount: 1500000000.0,
    ownerName: "Emily Davis",
  ),
  HouseModel(
    title: "Hilltop Mansion",
    subtitle: "Jl Puncak Indah",
    bedrooms: 8,
    bathrooms: 5,
    description: "A perfect getaway with a touch of nature.",
    imageUrl: "https://example.com/house5.jpg",
    rentAmount: 5000000000.0,
    ownerName: "Michael Johnson",
  ),
];

