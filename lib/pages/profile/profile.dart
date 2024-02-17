import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';
import 'package:trademale/widgets/app_icon.dart';
import 'package:trademale/widgets/profileTap.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(Dimension.height10, Dimension.height10,
              Dimension.height10, Dimension.height10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(routeHelper.getInitial());
                    },
                    child: AppIcon(
                        backgroundColor: Colors.transparent,
                        iconColor: Color(0xff6d6875),
                        icon: Icons.arrow_back_ios_new_rounded),
                  ),
                  SizedBox(
                    width: Dimension.width50 * 2.2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffb5838d), // Set the border color
                        width: 2.0, // Set the border width
                      ),
                      shape: BoxShape.circle, // Set the shape to circle
                    ),
                    child: Icon(
                      Icons.person,
                      size: Dimension.iconSize40 * 3.2,
                      color: Color(0xffb5838d),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              Text(
                'Noor Alden',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: Dimension.font26 * 1.2,
                    color: Color(0xff6d6875),
                    letterSpacing: 2),
              ),
              Text(
                'nooraldenberkdar80@gmail.com',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimension.font20,
                    color: Color(0xff6d6875),
                    letterSpacing: 1),
              ),
              SizedBox(
                height: Dimension.height50,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(routeHelper.getHistory());
                        },
                        child: ProfileTap(
                          name: 'Orders History',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(routeHelper.getDeliveryAddress());
                        },
                        child: ProfileTap(
                          name: 'My address',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'My wallet',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'Settings',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'Chat With Store',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'About Strore',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'About Developers',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ProfileTap(
                          name: 'Log out',
                        ),
                      ),
                    ],
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
