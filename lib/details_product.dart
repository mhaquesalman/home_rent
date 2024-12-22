import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_rent/button_colors.dart';
import 'package:home_rent/constants.dart';
import 'package:home_rent/home_details_controller.dart';
import 'package:readmore/readmore.dart';

class DetailsProductScreen extends StatefulWidget {
  const DetailsProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailsProductScreen> createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen> {
  final controller = Get.put(HomeDetailsController());
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            // Header Image Section with Overlay
            Stack(
              children: [
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/home1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: gradientBackgroundForImage()
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: IconButton(
                      icon: Icon(Icons.bookmark_border, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.username.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Jl. Sultan Iskandar Muda, Jakarta selatan',
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            buildIcon(Icons.bed, Colors.white, Colors.white),
                            SizedBox(width: 8),
                            Text('6 Bedroom', style: TextStyle(color: secondaryTextColor),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            buildIcon(Icons.bathtub, Colors.white, Colors.white),
                            SizedBox(width: 8),
                            Text('4 Bathroom', style: TextStyle(color: secondaryTextColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
              ReadMoreText(
                'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars, one gym one hall so many things,Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                trimMode: TrimMode.Length,
                trimLength: 80,
                colorClickableText: Colors.blue,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                style: TextStyle(fontSize: 14),
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.blue),
              ),
                ],
              ),
            ),

            // Owner Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/person.png'),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Garry Allen',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Owner', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  buildIcon(Icons.phone, Colors.white, Colors.blue),
                  SizedBox(width: 14,),
                  buildIcon(Icons.messenger, Colors.white, Colors.blue),
                ],
              ),
            ),

            // Gallery Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        images.length, (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 85,
                        height: 85,
                        child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(images[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (images.length > 4 && index == 3)
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                    gradient: gradientBackgroundForImage()
                                ),
                              ),
                              if (images.length > 4 && index == 3)
                              Align(
                                child: Text("+${images.length - 4}", style: TextStyle(fontSize: 30, color: Colors.white),),
                              )
                            ]
                        ),
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10,),

            // maps
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: place,
                          zoom: 13
                      ),
                      markers: Iterable.generate(1, (index) => Marker(
                          markerId: MarkerId("marker_id"),
                          icon: BitmapDescriptor.defaultMarker,
                          position: place,
                          infoWindow: InfoWindow(title: "This is marker")
                      )).toSet(),
                    ),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: gradientBackgroundForMap()
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: textColor
                              ),
                            ),
                            Text(
                              'Rp. 2.500.000.000 / Year',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: gradientBackground(),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Rent Now', style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  Container buildIcon(IconData icon, Color iconColor, Color backgroundColor) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(icon, color: iconColor),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: backgroundColor.withOpacity(0.4)),
    );
  }
}