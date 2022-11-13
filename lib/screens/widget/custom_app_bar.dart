import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/core/const_color.dart';

class CusAppBar extends StatelessWidget {
  const CusAppBar({super.key, required this.titleWidget, required this.icon});
  final Widget titleWidget;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: titleWidget,
          ),
          Container(
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
        ],
      ),
    );
  }
}
