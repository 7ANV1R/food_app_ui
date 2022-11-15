import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/theme/ui_helper.dart';
import 'package:food_app/core/value/const_asset.dart';
import 'package:food_app/core/theme/const_color.dart';
import 'package:food_app/screens/homepage/temp_data/category_data.dart';
import 'package:food_app/screens/homepage/temp_data/food_data.dart';
import 'package:food_app/screens/homepage/widget/color_converter.dart';
import 'package:food_app/screens/homepage/widget/custom_app_bar.dart';
import 'package:food_app/screens/homepage/widget/food_card.dart';
import 'package:food_app/screens/homepage/widget/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const String userName = 'Ray';
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kWhiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SlidingUpPanel(
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
                SizedBox(
                  height: size.height * 0.03,
                ),

                const ProductCardPart(),
              ],
            ),
          ),
          color: kBlackColor,
          parallaxEnabled: true,
          parallaxOffset: 0.1,
          minHeight: size.height * 0.13,
          maxHeight: size.height * 0.5,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(38),
          ),
          panelBuilder: (sc) => CartPanel(
            controller: sc,
          ),
        ),
      ),
    );
  }
}

class CartPanel extends StatelessWidget {
  const CartPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.zero,
      children: [
        kVerticalSpaceM,
        Center(
          child: Container(
            height: 3,
            width: 40,
            decoration: BoxDecoration(
              color: kPurpleColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              kHorizontalSpaceM,
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: kYellowColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '1',
                  style: GoogleFonts.outfit(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              kHorizontalSpaceM,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Cart',
                      style: GoogleFonts.outfit(
                        color: kWhiteColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '1 Item',
                      style: GoogleFonts.outfit(
                        color: kWhiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/french_fries.png',
                height: 85,
                fit: BoxFit.cover,
              ),
              kHorizontalSpaceM,
            ],
          ),
        )
      ],
    );
  }
}

class ProductCardPart extends StatelessWidget {
  const ProductCardPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final foodList = foodData;
    return SizedBox(
      height: size.height * 0.4,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = foodList[index];
          return FoodCard(
            item: item,
          );
        },
        separatorBuilder: (context, index) => kHorizontalSpaceM,
        itemCount: foodList.length,
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
