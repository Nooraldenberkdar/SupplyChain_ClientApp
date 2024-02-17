import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';

import '../../widgets/app_icon.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  TextEditingController firstNameController = TextEditingController();
  bool isFirstNameValid = false;
  TextEditingController lastNameController = TextEditingController();
  bool isLastNameValid = false;
  TextEditingController addressController = TextEditingController();
  bool isAddressValid = false;
  TextEditingController cityController = TextEditingController();
  bool isCityValid = false;
  TextEditingController phoneController = TextEditingController();
  bool isPhoneValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: Colors.red,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(Dimension.height10, Dimension.height10,
              Dimension.height10, Dimension.height10),
          //color: Colors.blue,
          height: Dimension.screenHeight,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    )
                  ],
                ),
                SizedBox(
                  height: Dimension.height30,
                ),
                Text(
                  'Enter the delivery address',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: Dimension.font26 * 1.4,
                      color: Color(0xff6d6875),
                      letterSpacing: 2),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimension.width30,
                      right: Dimension.width30,
                      top: Dimension.height50),
                  //color: Colors.black,
                  width: double.infinity,
                  height: Dimension.screenHeight / 1.5,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: Dimension.height50 * 1.5,
                        //color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: firstNameController,
                              decoration: new InputDecoration(
                                labelText: 'First name',
                                labelStyle: TextStyle(color: Color(0xff6d6875)),
                                //icon: new Icon(Icons.email),
                                // hintText: "nooralden@example.com",
                                hintStyle: TextStyle(color: Color(0x4c6d6875)),
                                // border: ,
                                suffixIcon: isFirstNameValid
                                    ? Icon(Icons.check, color: Colors.green)
                                    : null,
                              ),
                              onChanged: (text) {
                                bool isValid =
                                    RegExp(r'^[a-zA-Z\s]+$').hasMatch(text);

                                setState(() {
                                  isFirstNameValid = isValid;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: Dimension.height50 * 1.5,
                        //color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                labelText: 'Last name',
                                labelStyle: TextStyle(color: Color(0xff6d6875)),
                                // icon: Icon(Icons.person_sharp),
                                // hintText: "ex:Sarya",
                                hintStyle: TextStyle(color: Color(0x4c6d6875)),
                                // border: InputBorder.none,
                                suffixIcon: isLastNameValid
                                    ? Icon(Icons.check, color: Colors.green)
                                    : null, // Show a checkmark icon if the username is valid
                              ),
                              onChanged: (text) {
                                // Validate username format when the user enters text
                                bool isValid =
                                    RegExp(r'^[a-zA-Z\s]+$').hasMatch(text);

                                setState(() {
                                  isLastNameValid = isValid;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: Dimension.height50 * 1.5,
                        // color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: addressController,
                              decoration: new InputDecoration(
                                labelText: 'Address',
                                labelStyle: TextStyle(color: Color(0xff6d6875)),
                                // icon: new Icon(Icons.lock),
                                //  border: InputBorder.none,
                                suffixIcon: isAddressValid
                                    ? Icon(Icons.check, color: Colors.green)
                                    : null,
                              ),
                              onChanged: (text) {
                                bool isValid =
                                    RegExp(r'^[a-zA-Z\s]+$').hasMatch(text);

                                setState(() {
                                  isAddressValid = isValid;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: Dimension.height50 * 1.5,
                        // color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: cityController,
                              decoration: new InputDecoration(
                                labelText: 'City',
                                labelStyle: TextStyle(color: Color(0xff6d6875)),
                                // icon: new Icon(Icons.lock),
                                //  border: InputBorder.none,
                                suffixIcon: isCityValid
                                    ? Icon(Icons.check, color: Colors.green)
                                    : null,
                              ),
                              onChanged: (text) {
                                bool isValid =
                                    RegExp(r'^[a-zA-Z\s]+$').hasMatch(text);

                                setState(() {
                                  isCityValid = isValid;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: Dimension.height50 * 1.5,
                        // color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: phoneController,
                              decoration: new InputDecoration(
                                // icon: new Icon(Icons.lock),
                                //  border: InputBorder.none,
                                labelText: '+963',
                                labelStyle: TextStyle(color: Color(0xff6d6875)),
                                suffixIcon: isPhoneValid
                                    ? Icon(Icons.check, color: Colors.green)
                                    : null,
                              ),
                              onChanged: (text) {
                                bool isValid =
                                    RegExp(r'^\d{10}$').hasMatch(text);

                                setState(() {
                                  isPhoneValid = isValid;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: Dimension.height50 * 2,
                        margin:
                            EdgeInsets.symmetric(vertical: Dimension.height15),
                        //color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              minLines: 2,
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: 'Add a note ',
                                hintStyle: TextStyle(
                                  color: Color(0xffb5838d),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: Dimension.height50 * 2,
                      // ),
                      Container(
                        width: double.infinity,
                        //color: Colors.red,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                if (isFirstNameValid &&
                                    isLastNameValid &&
                                    isAddressValid &&
                                    isCityValid &&
                                    isPhoneValid) {
                                  print('correct');
                                } else
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.WARNING,
                                    headerAnimationLoop: false,
                                    animType: AnimType.bottomSlide,
                                    title: 'Error',
                                    desc: 'please enter your info',
                                    buttonsTextStyle:
                                        const TextStyle(color: Colors.black),
                                    showCloseIcon: false,
                                    btnCancelOnPress: null,
                                    btnOkOnPress: () {},
                                  ).show();
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimension.width5),
                                ),
                                backgroundColor: Color(0xffb5838d),
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('Save',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            letterSpacing: 0.8,
                                            color: Color(0xffffffff),
                                            height: 1.2,
                                            fontSize: Dimension.font20 * 1.2,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Icon(
                                    Icons.exit_to_app,
                                    size: Dimension.width30,
                                  ), // Icon on the right
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
