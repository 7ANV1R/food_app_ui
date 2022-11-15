import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/theme/const_color.dart';
import 'package:food_app/core/value/const_asset.dart';
import 'package:food_app/global_widget/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:websafe_svg/websafe_svg.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.item});
  final Map item;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              const DetailsAppBar(),
              //text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      size: 18,
                      color: Colors.red,
                    ),
                    Text(
                      '120 Kcal',
                      style: GoogleFonts.outfit(
                        color: kBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.3,
                child: PhotoView(
                  initialScale: size.aspectRatio * 0.5,
                  imageProvider: AssetImage(
                    item['img'],
                  ),
                  backgroundDecoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              SizedBox(
                height: size.height * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: SlideAction(
                  onSubmit: () {},
                  sliderButtonIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: WebsafeSvg.asset(kAssetIconTag),
                  ),
                  text: 'Add to cart',
                  textStyle: GoogleFonts.outfit(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  borderRadius: 41,
                  height: 82,
                  elevation: 0,
                  sliderButtonYOffset: 0,
                  // TODO: Tween animation 0 to -20
                  sliderButtonIconPadding: 0,
                  innerColor: kYellowColor,
                  outerColor: kBlackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CusAppBar(
      titleWidget: RichText(
        text: TextSpan(
            text: 'Chicken',
            style: GoogleFonts.outfit(
              color: kBlackColor,
              fontSize: 50,
              height: 0.9,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: '\nBurger',
                style: GoogleFonts.outfit(
                  color: kBlackColor,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
      ),
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: WebsafeSvg.asset(kAssetIconBack),
      ),
      onTaponIcon: () => Navigator.pop(context),
    );
  }
}
