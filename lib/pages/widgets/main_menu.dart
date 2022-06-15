import 'package:flutter/material.dart';
import 'package:web_support/core/app_responsive.dart';
import 'package:web_support/core/until/until.dart';
import 'package:web_support/model/menu_model.dart';
import 'package:web_support/pages/web_support.dart';

List<MenuModel> menus = [
  MenuModel(
    image: AppImage.menu1,
    nameVi: 'Hướng dẫn sử dụng',
    nameEn: 'Guide',
    linkVi: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79',
    linkEn: 'https://docs.lumi.vn/share/28e7dc26-b03c-4704-ba1c-26b6875b38b2',
  ),
  MenuModel(
    image: AppImage.menu2,
    nameVi: 'Works with Lumi Life',
    nameEn: 'Works with Lumi Life',
    linkVi: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79',
    linkEn: 'https://docs.lumi.vn/share/28e7dc26-b03c-4704-ba1c-26b6875b38b2',
  ),
  MenuModel(
    image: AppImage.menu3,
    nameVi: 'Kiến thức về nhà thông minh',
    nameEn: 'Knowledge about Smart Home',
    linkVi: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79',
    linkEn: 'https://docs.lumi.vn/share/28e7dc26-b03c-4704-ba1c-26b6875b38b2',
  ),
  MenuModel(
    image: AppImage.menu4,
    nameVi: 'Tính năng, sản phẩm mới',
    nameEn: 'New features, products',
    linkVi: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79',
    linkEn: 'https://docs.lumi.vn/share/28e7dc26-b03c-4704-ba1c-26b6875b38b2',
  ),
  MenuModel(
    image: AppImage.menu5,
    nameVi: 'Kinh nghiệm thi công',
    nameEn: 'Experience',
    linkVi: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79',
    linkEn: 'https://docs.lumi.vn/share/28e7dc26-b03c-4704-ba1c-26b6875b38b2',
  ),
  MenuModel(
    image: AppImage.menu6,
    nameVi: 'Giải pháp cho từng căn hộ',
    nameEn: 'Solution for each apartment',
    linkVi: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79',
    linkEn: 'https://docs.lumi.vn/share/28e7dc26-b03c-4704-ba1c-26b6875b38b2',
  ),
];

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
    required this.language,
  }) : super(key: key);

  final String language;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: GridView.count(
          crossAxisCount: AppResponsive.isMobile(context)
              ? 1
              : AppResponsive.isTablet(context)
                  ? 2
                  : 3,
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: List.generate(
            menus.length,
            (index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WebSupport(
                            url: language == 'vi'
                                ? menus[index].linkVi
                                : menus[index].linkEn,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      menus[index].image,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    language == 'vi'
                        ? menus[index].nameVi
                        : menus[index].nameEn,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
