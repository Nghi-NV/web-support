import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_support/core/until/until.dart';

PreferredSizeWidget appBar({
  required GlobalKey<NavigatorState> keyNavigation,
  required String language,
  required void Function(String?)? onChangeLanguage,
}) {
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
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButton<String>(
          items: [
            dropdownItem('vi'),
            dropdownItem('en'),
          ],
          value: language,
          onChanged: onChangeLanguage,
          underline: Container(),
          icon: Container(),
        ),
      ),
    ],
  );
}

DropdownMenuItem<String> dropdownItem(String value) {
  return DropdownMenuItem(
    value: value,
    child: Row(
      children: [
        SizedBox(
          width: 32,
          height: 20,
          child: SvgPicture.asset(
            value == 'vi' ? AppImage.vnFlag : AppImage.enFlag,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 4),
        Text(value == 'vi' ? 'Tiếng Việt' : 'English'),
      ],
    ),
  );
}
