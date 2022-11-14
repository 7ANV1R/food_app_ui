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
    return SizedBox(
      height: 300,
      width: 182,
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 182,
            color: Colors.transparent,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 230,
              width: 182,
              decoration: BoxDecoration(
                color: HexColor(item['cardColor']),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Image.asset(
              item['img'],
              height: 230,
              width: 230,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 180,
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
