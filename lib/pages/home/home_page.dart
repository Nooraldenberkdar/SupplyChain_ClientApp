import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/Products_controller.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';
import 'package:trademale/widgets/TabBar_button.dart';

import '../../widgets/ProductItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController _scrollController = ScrollController();
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
    final productsController = Get.find<ProductsController>();
    productsController.getProductsList(); // Initial load
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productsController.loadMoreProducts();
        // Load more products when scrolled to the bottom
      }
    });
    // The 'vsync' argument should typically be a TickerProvider, like 'this' for StatefulWidget.
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(Dimension.height10, Dimension.height10,
              Dimension.height10, Dimension.height10),
          //color: Colors.blue,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                        size: Dimension.iconSize40,
                        color: Color(0xffb5838d),
                        Icons.dehaze_outlined),
                  )
                ],
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              Text(
                'Welcome,Noor',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Dimension.font12,
                    color: Color(0xff5f5a5a),
                    letterSpacing: 0.5),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: Dimension.width5,
                        right: Dimension.width12,
                      ),
                      height: Dimension.height20 * 1.8,
                      //  width: double.infinity,
                      //color: Colors.red,
                      decoration: BoxDecoration(
                        color: Color(0x1e767680),
                        borderRadius: BorderRadius.circular(Dimension.radius20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Color(0xff5f5a5a),
                          suffixIconColor: Color(0xff5f5a5a),
                          suffixIcon: GestureDetector(
                            onLongPress: () {
                              // Handle microphone button tap here
                              print('Microphone button tapped');
                            },
                            child: Icon(Icons.mic_sharp),
                          ),
                          hintText: 'Search...',
                          hintStyle:
                              TextStyle(fontSize: Dimension.font12 * 1.1),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                        size: Dimension.iconSize40,
                        color: Color(0xffb5838d),
                        Icons.settings),
                  ),
                ],
              ),
              SizedBox(
                height: Dimension.height10,
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
                                text: 'Food',
                                width: Dimension.width50 * 1.5,
                                height: Dimension.height20 * 2,
                                backgroundColor: activeTabIndex == 0
                                    ? Color(0xffe5989b)
                                    : Colors.white,
                              ),
                              TabBarButton(
                                text: 'Cloths',
                                width: Dimension.width50 * 1.5,
                                height: Dimension.height20 * 2,
                                backgroundColor: activeTabIndex == 1
                                    ? Color(0xffe5989b)
                                    : Colors.white,
                              ),
                              TabBarButton(
                                text: 'else',
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: GetBuilder<ProductsController>(
                                        builder: (products) {
                                      return products.pListIsLoaded
                                          ? GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    2, // Number of products in a row
                                                crossAxisSpacing:
                                                    Dimension.width10,
                                                mainAxisSpacing:
                                                    Dimension.height10,
                                              ),
                                              itemCount: products
                                                          .productsList.length >
                                                      1
                                                  ? products.productsList.length
                                                  : 1,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                      routeHelper
                                                          .getProductDetails(
                                                              index, "home"),
                                                    );
                                                  },
                                                  child: ProductItem(
                                                    title: products
                                                        .productsList[index]
                                                        .name!,
                                                    subtitle: products
                                                        .productsList[index]
                                                        .description!,
                                                    imagePath:
                                                        'assets/images/ph2.png',
                                                    buyPrice: products
                                                        .productsList[index]
                                                        .price!,
                                                    sellPrice: products
                                                            .productsList[index]
                                                            .pPrice ??
                                                        0,
                                                  ),
                                                );
                                              },
                                              controller: _scrollController,
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                                color: Color(0xffe5989b),
                                              ),
                                            );
                                    }),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.red,
                                child: Icon(Icons.search),
                              ),
                              Container(
                                  color: Colors.yellow,
                                  child: Icon(Icons.settings)),
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
