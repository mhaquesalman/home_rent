import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_rent/constants.dart';
import 'package:home_rent/home_screen.dart';

class CustomDrawerScreen extends StatefulWidget {
  @override
  _CustomDrawerScreenState createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _mainScreenSlideAnimation;
  late Animation<double> _mainScreenScaleAnimation;
  double _dragStartX = 0.0;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _mainScreenSlideAnimation = Tween<double>(begin: 0.0, end: 220.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _mainScreenScaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void toggleDrawer() {
    setState(() {
      if (_isDrawerOpen) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          _dragStartX = details.globalPosition.dx;
        },
        onHorizontalDragUpdate: (details) {
          double delta = details.globalPosition.dx - _dragStartX;

          if (delta > 0 && !_isDrawerOpen) {
            // Dragging to open
            _animationController.value =
                (delta / 250).clamp(0.0, 1.0); // Progress the animation
          } else if (delta < 0 && _isDrawerOpen) {
            // Dragging to close
            _animationController.value =
                1.0 + (delta / 250).clamp(-1.0, 0.0); // Reverse the animation
          }
        },
        onHorizontalDragEnd: (details) {
          if (_animationController.value > 0.5) {
            _animationController.forward(); // Open fully
            _isDrawerOpen = true;
          } else {
            _animationController.reverse(); // Close fully
            _isDrawerOpen = false;
          }
        },
        child: Stack(
          children: [

            // Drawer Screen (Bottom Layer)
            Container(
              color: menuColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 70,),
                  buildListTile("Home", Icons.home, isSelected: true),
                  buildListTile("Profile", Icons.person),
                  buildListTile("Nearby", Icons.map),
                  Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                    child: Divider(color: Colors.white),
                  ),
                  buildListTile("Bookmark", FontAwesomeIcons.bookmark,),
                  buildListTile("Notification", FontAwesomeIcons.bell),
                  buildListTile("Message", FontAwesomeIcons.comment),
                  Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                    child: Divider(color: Colors.white,),
                  ),
                  buildListTile("Settings", FontAwesomeIcons.gear,),
                  buildListTile("Help", FontAwesomeIcons.circleInfo),
                  buildListTile("Logout", FontAwesomeIcons.powerOff),
                  SizedBox(height: 70,),
                ],
              ),
            ),

            // Main Screen (Top Layer)
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_mainScreenSlideAnimation.value, 0),
                  child: Transform.scale(
                    scale: _mainScreenScaleAnimation.value,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(_animationController.value * 30.0),
                          bottomLeft: Radius.circular(_animationController.value * 30.0),
                        ),
                        boxShadow: _isDrawerOpen
                            ? [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                          ),
                        ]
                            : [],
                      ),
                      child: HomeScreen(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String label, IconData icon, {bool isSelected = false}) {
    return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 30),
                    minTileHeight: 40,
                    leading: Icon(icon, color: isSelected ?  Colors.blue : Colors.white),
                    title: Text(label, style: TextStyle(color: isSelected ? Colors.blue : Colors.white),),
                  ),
                );
  }
}
