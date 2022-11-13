import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/const_asset.dart';
import 'package:food_app/core/const_color.dart';
import 'package:food_app/screens/widget/custom_app_bar.dart';
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
      ),
      child: Scaffold(
        body: ListView(
          children: [
            //appbar
            const HomeAppBar(userName: userName),
            //serchbar
            Container(),
          ],
        ),
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
