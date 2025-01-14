import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_rent/constants.dart';
import 'package:home_rent/home_screen.dart';

class CustomDrawerScreen extends StatefulWidget {
  @override
  _CustomDrawerScreenState createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _mainScreenSlideAnimation;
  late Animation<double> _mainScreenScaleAnimation;
  late Animation<Offset> _slideAnimation;
  List<AnimationController> _controllers = [];
  List<Animation<Offset>> _animations = [];
  double _dragStartX = 0.0;
  bool _isDrawerOpen = false;
  String selected = "Home";
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _mainScreenSlideAnimation = Tween<double>(begin: 0.0, end: 220).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
    );
    _mainScreenScaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
    );

    _slideAnimation = Tween<Offset>( begin: Offset(-1, 0), end: Offset(0, 0),).animate(
        CurvedAnimation( parent: _animationController, curve: Curves.easeInOut)
    );

    for (int i = 0; i < listMenu.length; i++) {
      _controllers.add(AnimationController(duration: Duration(milliseconds: 300), vsync: this,));

      _animations.add(
          Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0),).animate(
          CurvedAnimation(parent: _controllers[i], curve: Curves.easeInOut,))
      );
    }

    _controllers[_selectedIndex].value = 1.0; // Set initial selected tile to fully visible
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
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          _dragStartX = details.globalPosition.dx;
        },
        onHorizontalDragUpdate: (details) {
          double delta = details.globalPosition.dx - _dragStartX;

          if (delta > 0 && !_isDrawerOpen) {
            // Dragging to open
            _animationController.value = (delta / 250).clamp(0.0, 1.0); // Progress the animation
          } else if (delta < 0 && _isDrawerOpen) {
            // Dragging to close
            _animationController.value = 1.0 + (delta / 250).clamp(-1.0, 0.0); // Reverse the animation
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

                  for (int i = 0; i < listMenu.length; i++) ...[
                    buildListTile(listMenu[i].title, listMenu[i].icon, i),
                    if (i == 3 || i == 6)
                      Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                        child: Divider(color: Colors.white),
                      ),
                  ],

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
                        boxShadow: _isDrawerOpen ? [
                          const BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                          ),
                        ] : [],
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


  void _onTileTap(int index) {
    setState(() {
      _selectedIndex = index;
      _controllers[index].forward(from: 0.0);
    });
  }

  Widget buildListTile(String label, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        _onTileTap(index);
      },
      child: SlideTransition(
        position: _selectedIndex == index ? _animations[index] : AlwaysStoppedAnimation(Offset.zero),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 30),
            minTileHeight: 40,
            leading: Icon(icon, color: _selectedIndex == index ? Colors.blue : Colors.white),
            title: Text(
              label,
              style: TextStyle(color: _selectedIndex == index ? Colors.blue : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
