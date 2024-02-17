import 'package:flutter/material.dart';
import 'package:trademale/utilities/dimensions.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final int buyPrice;
  final int sellPrice;

  ProductItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.buyPrice,
    required this.sellPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimension.height10,
        left: Dimension.height5,
      ),
      //color: Colors.red,
      height: Dimension.height50 * 4.05,
      width: Dimension.width30 * 6,
      child: Stack(
        children: [
          Container(
            height: Dimension.height30 * 4.3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePath),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                left: Dimension.width10,
              ),
              height: Dimension.height20 * 3.8,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: Dimension.font12 * 1.4,
                          fontWeight: FontWeight.w900,
                          letterSpacing: Dimension.width5 / 3,
                          color: Color(0xff161616),
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Color(0xffe5989b),
                      ),
                    ],
                  ),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xffa3a3a3),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${buyPrice.toString()}',
                        style: TextStyle(
                          color: Color(0xffe5989b),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$ ${sellPrice.toString()}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
