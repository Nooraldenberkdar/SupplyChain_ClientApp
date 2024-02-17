import 'package:flutter/material.dart';
import 'package:trademale/utilities/dimensions.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem(
      {super.key,
      required this.date,
      required this.name,
      required this.address,
      required this.number,
      required this.image});

  final String date;
  final String name;
  final String address;
  final String number;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimension.height10,
        bottom: Dimension.height10,
      ),
      padding: EdgeInsets.only(
        left: Dimension.width20,
      ),
      decoration: BoxDecoration(
        color: Color(0x26e57b7f),
        borderRadius: BorderRadius.circular(15),
      ),
      height: Dimension.height50 * 3,
      width: double.infinity,
      // color: Colors.red,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: Dimension.font20,
                      color: Color(0xff6d6875)),
                ),
                SizedBox(
                  height: Dimension.height30,
                ),
                Text(
                  '$name\n$address\n$number',
                  style: TextStyle(
                      color: Color(0xff6d6875),
                      fontWeight: FontWeight.w400,
                      fontSize: Dimension.font12 * 1.4),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: Dimension.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
            width: Dimension.width50 * 2.5,
            height: Dimension.height50 * 2.5,
          ),
        ],
      ),
    );
  }
}
