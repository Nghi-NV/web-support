import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_support/core/until/until.dart';
import 'package:web_support/model/menu_model.dart';
import 'package:web_support/pages/web_support.dart';

List<MenuModel> menus = [
  MenuModel(
      image: AppImage.menu1,
      name: 'Hướng dẫn sử dụng',
      link: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79'),
  MenuModel(
      image: AppImage.menu2,
      name: 'Works with Lumi Life',
      link: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79'),
  MenuModel(
      image: AppImage.menu3,
      name: 'Kiến thức về nhà thông minh',
      link: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79'),
  MenuModel(
      image: AppImage.menu4,
      name: 'Tính năng, sản phẩm mới',
      link: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79'),
  MenuModel(
      image: AppImage.menu5,
      name: 'Kinh nghiệm thi công',
      link: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79'),
  MenuModel(
      image: AppImage.menu6,
      name: 'Giải pháp cho từng căn hộ',
      link: 'https://docs.lumi.vn/share/02a7ef2c-bee9-4e79-84ab-39c64be5ee79'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        // color: Colors.red,
        child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
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
                            url: menus[index].link,
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
                    menus[index].name,
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
