import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademale/conrtollers/suppliers_controller.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';
import 'package:trademale/widgets/supplierItem.dart';

import '../../../widgets/app_icon.dart';

class SuppliersPage extends StatefulWidget {
  const SuppliersPage({super.key});

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimension.width5, top: Dimension.width5),
              height: Dimension.height50 * 2.4,
              width: double.infinity,
              color: Color(0x33de1b25),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: AppIcon(
                            backgroundColor: Colors.transparent,
                            iconColor: Color(0xff6d6875),
                            icon: Icons.arrow_back_ios_new_rounded),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimension.width5,
                      right: Dimension.width12,
                    ),
                    height: Dimension.height20 * 2.1,
                    //  width: double.infinity,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      color: Color(0x1e767680),
                      borderRadius: BorderRadius.circular(20),
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
                        hintStyle: TextStyle(fontSize: Dimension.font12 * 1.1),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: Dimension.screenHeight,
                width: Dimension.screenWidth,
                //color: Colors.greenAccent,
                margin: EdgeInsets.fromLTRB(Dimension.height10,
                    Dimension.height10, Dimension.height10, Dimension.height10),
                child: GetBuilder<SuppliersController>(
                  builder: (suppliersController) {
                    return suppliersController.sListIsLoaded
                        ? ListView.builder(
                            itemCount:
                                suppliersController.suppliersList.length > 1
                                    ? suppliersController.suppliersList.length
                                    : 1,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  await Get.find<SuppliersController>()
                                      .getSupplierDetails(suppliersController
                                          .suppliersList[index].id);

                                  Get.toNamed(routeHelper.getSupplier(index));
                                },
                                child: SupplierItem(
                                  title: suppliersController
                                      .suppliersList[index].name!,
                                  subtitle: suppliersController
                                      .suppliersList[index].category!,
                                  imagePath: suppliersController
                                      .suppliersList[index].companyImage!,
                                  email: suppliersController
                                      .suppliersList[index].email!,
                                ),
                              );
                            },
                            // crossAxisAlignment: CrossAxisAlignment.start,
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffe5989b),
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
