import 'package:flutter/material.dart';
import 'package:online_course_dark/screens/account.dart';
import 'package:online_course_dark/screens/chat.dart';
import 'package:online_course_dark/screens/explore.dart';
import 'package:online_course_dark/screens/home.dart';
import 'package:online_course_dark/screens/player.dart';

import '../theme/color.dart';
import '../widgets/bottombar_items.dart';

class RootApp extends StatefulWidget {
  RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: activePageIndex,
      children: List.generate(
        tabItems.length,
        (index) => tabItems[index]['page'],
      ),
    );
  }

  int activePageIndex = 0;

  List tabItems = [
    {
      'icon': 'assets/icons/home.svg',
      'page': HomePage(),
    },
    {
      'icon': 'assets/icons/search.svg',
      'page': ExplorePage(),
    },
    {
      'icon': 'assets/icons/play.svg',
      'page': PlayerPage(),
    },
    {
      'icon': 'assets/icons/chat.svg',
      'page': ChatPage(),
    },
    {
      'icon': 'assets/icons/profile.svg',
      'page': AccountPage(),
    },
  ];

  Widget buildBottomBar() {
    return Container(
      width: double.infinity,
      height: 75,
      padding: EdgeInsets.fromLTRB(25, 0, 25, 15),
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              color: AppColor.shadowColor.withOpacity(.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          tabItems.length,
          (index) => BottomBarItem(
            icons: tabItems[index]['icon'],
            isActive: activePageIndex == index,
            onTap: () {
              onPageIndexChange(index);
            },
          ),
        ),
      ),
    );
  }

  onPageIndexChange(index) {
    setState(() {
      activePageIndex = index;
    });
  }
}
