import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_support/core/until/until.dart';

PreferredSizeWidget appBar(GlobalKey<NavigatorState> keyNavigation) {
  return AppBar(
    backgroundColor: AppColor.kAppBarColor,
    title: const Text('Lumi Support'),
    leadingWidth: 200,
    leading: InkWell(
      onTap: () {
        keyNavigation.currentState!.maybePop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 48,
        child: SvgPicture.asset(
          AppImage.logo,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
