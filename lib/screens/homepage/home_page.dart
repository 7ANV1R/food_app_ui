import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/theme/ui_helper.dart';
import 'package:food_app/core/value/const_asset.dart';
import 'package:food_app/core/theme/const_color.dart';
import 'package:food_app/screens/homepage/temp_data/category_data.dart';
import 'package:food_app/screens/homepage/widget/color_converter.dart';
import 'package:food_app/screens/homepage/widget/custom_app_bar.dart';
import 'package:food_app/screens/homepage/widget/food_card.dart';
import 'package:food_app/screens/homepage/widget/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String userName = 'Ray';
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kWhiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //appbar
              const HomeAppBar(userName: userName),
              //serchbar
              const SearchBar(),
              // chip
              kVerticalSpaceL,
              const CatergoryChip(),
              kVerticalSpaceL,
              // card part
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Let’s Order",
                        style: GoogleFonts.outfit(
                          color: kBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.local_fire_department,
                      size: 18,
                      color: Colors.red,
                    ),
                    Text(
                      "50+",
                      style: GoogleFonts.outfit(
                        color: kBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // main card

              const FoodCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatergoryChip extends StatelessWidget {
  const CatergoryChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = categoryData;
    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = category[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: HexColor(item['bgColor']),
              borderRadius: BorderRadius.circular(21),
            ),
            child: Text(
              '${item['title']}',
              style: GoogleFonts.outfit(
                color: kBlackColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => kHorizontalSpaceM,
        itemCount: category.length,
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return CusAppBar(
      titleWidget: RichText(
        text: TextSpan(
            text: 'Hello, ',
            style: GoogleFonts.outfit(
              color: kBlackColor,
              fontSize: 50,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: userName,
                style: GoogleFonts.outfit(
                  color: kBlackColor,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: '\nDo you want to order something?',
                style: GoogleFonts.outfit(
                  color: kDarkGreyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
      ),
      icon: WebsafeSvg.asset(kAssetIconMenu),
    );
  }
}
