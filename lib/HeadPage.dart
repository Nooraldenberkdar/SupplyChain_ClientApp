import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trademale/pages/cart/ordersHistory_page.dart';
import 'package:trademale/pages/home/home_page.dart';
import 'package:trademale/pages/home/suppliers/suppliers_page.dart';
import 'package:trademale/pages/watchList/watchListPage.dart';

class HeadPage extends StatefulWidget {
  final String? oldPage;

  const HeadPage({Key? key, required this.oldPage}) : super(key: key);

  @override
  State<HeadPage> createState() => _HomePageState();
}

class _HomePageState extends State<HeadPage> {
  //int selectedIndex = 0;
  late PersistentTabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        PersistentTabController(initialIndex: int.parse(widget.oldPage!));
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      SuppliersPage(),
      OrdersHistoryPage(),
      WatchListPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Color(0xffb5838d),
        inactiveColorPrimary: Color(0xFF6D6875),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.store_mall_directory_sharp),
        title: ("suppliers"),
        activeColorPrimary: Color(0xffb5838d),
        inactiveColorPrimary: Color(0xFF6D6875),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox),
        title: ("History"),
        activeColorPrimary: Color(0xffb5838d),
        inactiveColorPrimary: Color(0xFF6D6875),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.wash),
        title: ("Watch list"),
        activeColorPrimary: Color(0xffb5838d),
        inactiveColorPrimary: Color(0xFF6D6875),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PersistentTabView(
                context,
                controller: _controller,
                screens: _buildScreens(),
                items: _navBarsItems(),
                confineInSafeArea: true,
                backgroundColor: Colors.white,
                //margin: EdgeInsets.all(20),
                // Default is Colors.white.
                handleAndroidBackButtonPress: true,
                // Default is true.
                resizeToAvoidBottomInset: true,
                // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true,
                // Default is true.
                hideNavigationBarWhenKeyboardShows: true,
                // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                decoration: NavBarDecoration(
                  border: Border.all(
                      color: Color(0xffb5838d),
                      width: 1), // Black border with desired width

                  colorBehindNavBar: Colors.white,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: ItemAnimationProperties(
                  // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimation(
                  // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle
                    .style12, // Choose the nav bar style with this property.
              ),
            )
          ],
        ),
      ),
    );
  }
}
