import 'package:flutter/material.dart';
import 'package:food_app/core/value/const_asset.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
      ),
      child: TextFormField(
        // controller: textEditingController,
        onFieldSubmitted: (value) {},
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Search Food',
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 17,
          ),
          prefixIcon: WebsafeSvg.asset(
            kAssetIconSearch,
            height: 16,
            width: 16,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
