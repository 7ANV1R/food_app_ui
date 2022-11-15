import 'package:flutter/material.dart';
import 'package:food_app/core/theme/const_color.dart';
import 'package:food_app/core/theme/ui_helper.dart';
import 'package:food_app/screens/homepage/widget/color_converter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.item});
  final Map item;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      width: size.width * 0.49,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.3,
              width: size.width * 0.49,
              decoration: BoxDecoration(
                color: HexColor(item['cardColor']),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.125,
            left: 0,
            right: 0,
            child: Image.asset(
              item['img'],
              height: size.height * 0.31,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: size.height * 0.24,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  item['foodName'],
                  style: GoogleFonts.outfit(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                kVerticalSpaceXS,
                Text(
                  item['restaurantName'],
                  style: GoogleFonts.outfit(
                    color: kDarkGreyColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                kVerticalSpaceS,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    '\$${item['price']}',
                    style: GoogleFonts.outfit(
                      color: kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
