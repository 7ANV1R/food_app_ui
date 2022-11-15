import 'package:flutter/material.dart';
import 'package:food_app/core/theme/const_color.dart';

class CusAppBar extends StatelessWidget {
  const CusAppBar({super.key, required this.titleWidget, required this.icon, this.onTaponIcon});
  final Widget titleWidget;
  final Widget icon;
  final VoidCallback? onTaponIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(26, 20, 26, 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: titleWidget,
            ),
            GestureDetector(
              onTap: onTaponIcon,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 18),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5.0,
                    color: kLightGreyColor,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
