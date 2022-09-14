import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_skillriser_app/services/features.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          Features(),
        ],
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          backgroundColor: Colors.black,
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.white),
          unselectedItemColor: Colors.white,
          iconSize: 20,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: ('Features'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: ('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call_rounded),
              label: ('MyLeraning'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: ('Wishlist'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ('Account'),
            ),
          ]),
    );
  }
}
