import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_rent/button_colors.dart';
import 'package:home_rent/constants.dart';
import 'package:home_rent/details_product.dart';
import 'package:home_rent/home_details_controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location", style: TextStyle(color: textColor, fontSize: 14),),
                SizedBox(width: 8),
                Row(
                  children: [
                    Text("Jakarta", style: TextStyle(color: Colors.black)),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ],
                )
              ],
            ),
            Image.asset("assets/images/notification.png", width: 25, height: 25,),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_rounded, color: textColor,),
                      hintStyle: TextStyle(fontWeight: FontWeight.normal, color: textColor),
                      hintText: "Search address, or near you",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: colorBg,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: gradientBackground(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset("assets/images/settings.png", width: 28, height: 28,),
                )
              ],
            ),

            SizedBox(height: 16),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryChip("House", true),
                _buildCategoryChip("Apartment", false),
                _buildCategoryChip("Hotel", false),
                _buildCategoryChip("Villa", false),
              ],
            ),

            SizedBox(height: 16),

            // "Near from you" section
            _buildSectionHeader("Near from you"),

            SizedBox(height: 8),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildPropertyCard("Dreamsville House", "Jl Sultan Iskandar Muda", "1.8 km"),
                  SizedBox(width: 8),
                  _buildPropertyCard("Ascot House", "Jl Cilandak Tengah", "2.5 km"),
                ],
              ),
            ),

            SizedBox(height: 16),

            // "Best for you" section
            _buildSectionHeader("Best for you"),

            SizedBox(height: 8),

            Expanded(
              child: ListView(
                children: [
                  _buildListProperty("Orchard House", "Rp. 2.500.000.000 / Year", 6, 4),
                  _buildListProperty("The Hollies House", "Rp. 2.000.000.000 / Year", 5, 3),
                  _buildListProperty("San Francisco House", "Rp. 3.000.000.000 / Year", 8, 6),
                  _buildListProperty("San Francisco House", "Rp. 3.000.000.000 / Year", 8, 6),
                  _buildListProperty("San Francisco House", "Rp. 3.000.000.000 / Year", 8, 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: isSelected ? gradientBackground() : null,
        color: !isSelected ? colorBg : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("See more", style: TextStyle(color: textColor)),
      ],
    );
  }

  Widget _buildPropertyCard(String title, String address, String distance) {
    return InkWell(
      onTap: () {
        controller.setUsername(title);
        Get.to(DetailsProductScreen());
      },
      child: Container(
        width: 220,
        height: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
          image: DecorationImage(
            image: NetworkImage("https://cdn.pixabay.com/photo/2016/11/29/03/53/house-1867187_960_720.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.white, size: 20,),
                    Text(distance, style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListProperty(String title, String price, int bedrooms, int bathrooms) {
    return GestureDetector(
      onTap: () {
        controller.setUsername(title);
        Get.to(DetailsProductScreen());
      },
      child: Container(
        width: double.infinity,
        height: 80,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8, top: 8, bottom: 8), 
              width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage("https://cdn.pixabay.com/photo/2022/04/10/19/33/house-7124141_1280.jpg"),
                fit: BoxFit.cover,
              ),
            ),),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                Text(price, style: TextStyle(color: Colors.blue),),
                Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.bed, color: Colors.black26,),
                          Text("$bedrooms Bedroom", style: TextStyle(color: Colors.black38),),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Row(
                        children: [
                          Icon(Icons.bathtub_rounded, color: Colors.black26,),
                          Text("$bedrooms Bedroom", style: TextStyle(color: Colors.black38),),
                        ],
                      ),
                    ]
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
