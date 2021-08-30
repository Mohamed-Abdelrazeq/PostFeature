import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'FeedPage.dart';
import 'GroupsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (num){
                setState(() {
                  _currentPage = num;
                });
              },
              children: [
                FeedPage(),
                GroupsPage()
              ],
            ),
          ),
          Container(
            height: 50.h,
            width: 360.w,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _currentPage == 0 ? Icon(Icons.home,color: Colors.white,) : InkWell(
                    onTap: (){
                      _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    },
                    child: Icon(Icons.home,color: Colors.white60,)),
                _currentPage == 1 ? Icon(Icons.group,color: Colors.white,) : InkWell(
                    onTap: (){
                      _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    },
                    child: Icon(Icons.group,color: Colors.white60,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
