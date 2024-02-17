import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';
import 'package:trademale/widgets/orderHistoryItem.dart';

import '../../widgets/TabBar_button.dart';
import '../../widgets/app_icon.dart';

class OrdersHistoryPage extends StatefulWidget {
  const OrdersHistoryPage({super.key});

  @override
  State<OrdersHistoryPage> createState() => _OrdersHistoryPageState();
}

class _OrdersHistoryPageState extends State<OrdersHistoryPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int activeTabIndex = 0;
  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController?.addListener(() {
      setState(() {
        activeTabIndex = _tabController!.index;
      });
    });

    // The 'vsync' argument should typically be a TickerProvider, like 'this' for StatefulWidget.
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(
            Dimension.height10,
            Dimension.height10,
            Dimension.height10,
            Dimension.height10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(routeHelper.getProfile());
                    },
                    child: AppIcon(
                        backgroundColor: Colors.transparent,
                        iconColor: Color(0xff6d6875),
                        icon: Icons.arrow_back_ios_new_rounded),
                  ),
                  SizedBox(
                    width: Dimension.width50 * 2,
                  ),
                  Text(
                    'Order History',
                    style: TextStyle(
                      fontSize: Dimension.font20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff5f5a5a),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimension.height50,
              ),
              Expanded(
                child: Container(
                  //color: Colors.yellow,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                            indicatorColor: Colors.transparent,
                            controller: _tabController,
                            tabs: tabs = [
                              TabBarButton(
                                text: 'All',
                                width: Dimension.width50 * 1.5,
                                height: Dimension.height20 * 2,
                                backgroundColor: activeTabIndex == 0
                                    ? Color(0xffe5989b)
                                    : Colors.white,
                              ),
                              TabBarButton(
                                text: 'Done',
                                width: Dimension.width50 * 1.5,
                                height: Dimension.height20 * 2,
                                backgroundColor: activeTabIndex == 1
                                    ? Color(0xffe5989b)
                                    : Colors.white,
                              ),
                              TabBarButton(
                                text: 'Cancel',
                                width: Dimension.width50 * 1.5,
                                height: Dimension.height20 * 2,
                                backgroundColor: activeTabIndex == 2
                                    ? Color(0xffe5989b)
                                    : Colors.white,
                              )
                            ]),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  // Use index to access each item in your data list
                                  return OrderHistoryItem(
                                    date: '20/11/2019,12:10 AM',
                                    name: 'Noor Alden',
                                    address: 'Damascus',
                                    number: '+963936553239',
                                    image: 'assets/images/ph1.png',
                                  );
                                },
                              ),
                              Container(
                                color: Colors.red,
                                child: Icon(Icons.search),
                              ),
                              Container(
                                color: Colors.yellow,
                                child: Icon(Icons.settings),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
